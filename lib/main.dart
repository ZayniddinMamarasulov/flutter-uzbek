import 'package:flutter/material.dart';
import 'package:flutter_uzbek/view/components/popular_item.dart';
import 'package:flutter_uzbek/view/home_page.dart';
import 'package:flutter_uzbek/view/my_profil_page.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthPage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        MyProfilPage.id: (context) => MyProfilPage(),
        PopularItem.id: (context) => PopularItem(),
        PopularPostsPAge.id: (context) => PopularPostsPAge(),
        PosttPage.id: (context) => PosttPage(),
        AuthPage.id: (context) => AuthPage(),
        SignupPage.id: (context) => SignupPage(),
        LoginPage.id: (context) => LoginPage(),
      },
    );
  }
}
