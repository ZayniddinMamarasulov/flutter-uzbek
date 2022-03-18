import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import '../model/user.dart';

class AuthViewModel extends ChangeNotifier {
  var _status = AuthStatus.NOT_SIGN_IN;

  String _errorMessage = "";

  String get errorMessage {
    return _errorMessage;
  }

  AuthStatus get authStatus {
    return _status;
  }

  uploadAvatar(String name, File selectedImage) async {
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
        saveCredentials(user, pass);
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

  saveCredentials(MyUser user, pass) async {
    final CollectionReference userCollections =
        FirebaseFirestore.instance.collection('users');
    try {
      final userDoc = userCollections.doc(user.id);
      await userDoc.set(user.toJson());
      signIn(user.email, pass);
    } catch (e) {
      print("user-collection-exception: $e");
    }
  }

  signIn(email, pass) async {
    // showLoader(true);
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      _status = AuthStatus.COMPLETED;
      notifyListeners();
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
}

enum AuthStatus { NOT_SIGN_IN, LOADING, COMPLETED, ERROR }
