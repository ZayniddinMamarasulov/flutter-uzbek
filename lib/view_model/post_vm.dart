import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

import '../model/my_post_model.dart';

class PostViewModel extends ChangeNotifier {

  MyPosts? _currentPost;

  MyPosts? get currentPost {
    return _currentPost;
  }

  

   uploadImage(String title, File selectedImage) async{
    var firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('post_images')
        .child('$title.jpg');
    final task = firebaseStorageRef.putFile(selectedImage);

    var downloadUrl = await (await task).ref.getDownloadURL();
    return downloadUrl;
  }
  // create post

   ceretePost(title,text,downloadUrl) async{
     final FirebaseFirestore firestore=FirebaseFirestore.instance;
     try{
       await firestore.collection('posts')
           .doc('${title.replaceAll(" ", "_")}')
           .set({
         'title':'$title',
         'text':'$text',
         'imageUrl':downloadUrl
       });

     }catch(e){
       print(e);
     }
   }



   getCurrentPost() async {
     final id = FirebaseAuth.instance.currentUser?.uid;

     final currentUser =
     await FirebaseFirestore.instance.collection('posts').doc(id).get();

     final userData = currentUser.data();

     _currentPost = MyPosts.fromJson(userData!);
     notifyListeners();
   }


  CollectionReference<MyPosts> fetchPosts(){
    return FirebaseFirestore.instance
        .collection('posts')
        .withConverter<MyPosts>(
      fromFirestore: (snapshots, _) => MyPosts.fromJson(snapshots.data()!),
      toFirestore: (post, _) => post.toJson(),
    );
  }

  void delete(MyPosts mypost)async{
    final FirebaseFirestore firestore=FirebaseFirestore.instance;
    try{
      firestore
          .collection('posts')
          .doc('${mypost.title?.replaceAll(" ", "_")}')
          .delete();
      fetchPosts();
    }catch(e){
      print(e);
    }
  }
}
