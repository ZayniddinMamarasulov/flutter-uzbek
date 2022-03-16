import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uzbek/color/app_color.dart';
import 'package:flutter_uzbek/model/user.dart';
import 'package:flutter_uzbek/view/register_and_login/auth_page/auth_page.dart';
import 'package:image_picker/image_picker.dart';

import 'components/payment.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);
  static const String id = "my_profile_page";

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final _picker = ImagePicker();

  String name="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.containerFiveColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image(
            image: AssetImage('assets/icons/back.png'),
          ),
        ),
        title: Text(
          'My Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            color: Colors.blue,
            icon: ImageIcon(AssetImage("assets/icons/iconn.png")),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: getCurrentUser(),
          builder: (BuildContext context, AsyncSnapshot<MyUser> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            return initUI(snapshot.data!);
          },
        ),
      ),
    );
  }



  Widget initUI(MyUser user) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Column(
            children: [
              InkWell(
                onTap: (){
                  //getImage();

                },
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: CircleAvatar(child: Image.network(user.userimageUrl!)),

                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 4),
              Text(
                user.fullName!,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 4),
              Text(
                user.email!,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                padding: EdgeInsets.all(16),
                height: 100,
                width: double.infinity,
                child: const Center(
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultrices lectus in pellentesque elit dui",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey,
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 66,
                    child: const Center(
                      child: Text(
                        "Followers",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  )),
                  Expanded(
                      child: Container(
                    child: const Center(
                      child: Text(
                        "Following",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  )),
                ],
              ),
              Container(
                height: 1,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                height: 24,
                width: 101,
                color: Colors.green,
                child: const Center(
                  child: Text(
                    "PAYMENT RATE",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Payment(),
              const SizedBox(
                height: 46,
              ),
              TextButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushNamedAndRemoveUntil(
                        context, AuthPage.id, (r) => false);
                  },
                  child: const Text(
                    "Sign out",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )
              )
            ],
          )
        ],
      ),
    );
  }

  Future<MyUser> getCurrentUser() async {
    final id = FirebaseAuth.instance.currentUser?.uid;

    final currentUser =
        await FirebaseFirestore.instance.collection('users').doc(id).get();

    final userData = currentUser.data();

    return MyUser.fromData(userData!);
  }



  // void _create()async{
  //   setState(() {
  //     _isLoading=true;
  //   });
  //   var firebaseStorageRef = FirebaseStorage.instance
  //       .ref()
  //       .child('profil_images')
  //       .child('$name.jpg');
  //   final task = firebaseStorageRef.putFile(_selectedImage);
  //
  //   var downloadUrl = await (await task).ref.getDownloadURL();
  //   print('this is url $downloadUrl');
  // }


  // Future getImage() async {
  //   final pickedFile = await _picker.getImage(source: ImageSource.gallery);
  //
  //   setState(() {
  //     if (pickedFile != null) {
  //       _selectedImage = File(pickedFile.path);
  //     } else {
  //       print('No image selected.');
  //     }
  //   });
  // }

}
