import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../model/user.dart';

class AuthViewModel extends ChangeNotifier {
  var _status = AuthStatus.NOT_SIGN_IN;
  var _signInMethod = SignInMethod.EMAIL;

  String _errorMessage = "";
  MyUser? _currentUser;
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _googleUser;

  GoogleSignInAccount get googleUser {
    return _googleUser!;
  }

  String get errorMessage {
    return _errorMessage;
  }

  AuthStatus get authStatus {
    return _status;
  }

  set authStatus(status) {
    _status = status;
  }

  MyUser? get currentUser {
    return _currentUser;
  }

  Future<String> uploadAvatar(String name, File selectedImage) async {
    var firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('profil_images')
        .child('$name.jpg');
    final task = firebaseStorageRef.putFile(selectedImage);

    var downloadUrl = await (await task).ref.getDownloadURL();

    return downloadUrl;
  }

  createUser(name, email, pass, downloadUrl) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass)
          .then((current) {
        MyUser user = MyUser(
            id: current.user?.uid,
            fullName: name,
            email: email,
            userRole: 'user',
            userimageUrl: downloadUrl);
        saveCredentials(user, pass: pass);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        _errorMessage = 'The account already exists for that email.';
      }
    } catch (e) {
      _errorMessage = e.toString();
      print(e);
    }
  }

  saveCredentials(MyUser user, {pass, credential}) async {
    final CollectionReference userCollections =
        FirebaseFirestore.instance.collection('users');
    try {
      final userDoc = userCollections.doc(user.id);
      await userDoc.set(user.toJson());
      if (_signInMethod == SignInMethod.EMAIL) {
        signIn(user.email, pass);
      } else if (_signInMethod == SignInMethod.GOOGLE) {
        _status = AuthStatus.COMPLETED;
        notifyListeners();
      }
    } catch (e) {
      print("user-collection-exception: $e");
    }
  }

  signIn(email, pass) async {
    // showLoader(true);
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass)
          .then((value) {
        _status = AuthStatus.COMPLETED;
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      // showLoader(false);
      if (e.code == 'user-not-found') {
        _errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        _errorMessage = 'Wrong password provided for that user.';
      }
    } catch (e) {
      // showLoader(false);
      _errorMessage = e.toString();
    }
  }

  getCurrentUser() async {
    final id = FirebaseAuth.instance.currentUser?.uid;

    final currentUser =
        await FirebaseFirestore.instance.collection('users').doc(id).get();

    final userData = currentUser.data();

    _currentUser = MyUser.fromData(userData!);
    notifyListeners();
  }

  Future googleLogin() async {
    _signInMethod = SignInMethod.GOOGLE;

    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _googleUser = googleUser;

    final googleAuth = await googleUser.authentication;

    _status = AuthStatus.LOADING;
    notifyListeners();

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    MyUser user = MyUser(
        id: FirebaseAuth.instance.currentUser?.uid,
        fullName: googleUser.displayName!,
        email: googleUser.email,
        userRole: 'user',
        userimageUrl: googleUser.photoUrl!);

    saveCredentials(user, credential: credential);

    notifyListeners();
  }
}

enum AuthStatus { NOT_SIGN_IN, LOADING, COMPLETED, ERROR }

enum SignInMethod { PHONE, EMAIL, GOOGLE }
