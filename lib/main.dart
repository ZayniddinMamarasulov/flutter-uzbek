import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uzbek/view/add_post_page.dart';
import 'package:flutter_uzbek/view/components/popular_item.dart';
import 'package:flutter_uzbek/view/home_page.dart';
import 'package:flutter_uzbek/view/my_profile_page.dart';
import 'package:flutter_uzbek/view/popular_posts_page.dart';
import 'package:flutter_uzbek/view/postt_page.dart';
import 'package:flutter_uzbek/view/register_and_login/auth_page/auth_page.dart';
import 'package:flutter_uzbek/view/register_and_login/login_page/login_page.dart';
import 'package:flutter_uzbek/view/register_and_login/signup_page/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirebaseAuth.instance.currentUser?.uid == null
          ? AuthPage()
          : HomePage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        MyProfilePage.id: (context) => MyProfilePage(),
        PopularItem.id: (context) => PopularItem(),
        PopularPostsPAge.id: (context) => PopularPostsPAge(),
        PosttPage.id: (context) => PosttPage(),
        AuthPage.id: (context) => AuthPage(),
        SignupPage.id: (context) => SignupPage(),
        LoginPage.id: (context) => LoginPage(),
        AddPostPage.id: (context) => AddPostPage(),
      },
    );
  }

  Future<bool> _isUserLoggedIn() async {
    return FirebaseAuth.instance.currentUser != null;
  }
}
