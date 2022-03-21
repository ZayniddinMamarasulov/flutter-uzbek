import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uzbek/utils/app_them.dart';
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
import 'package:flutter_uzbek/view_model/auth_vm.dart';
import 'package:flutter_uzbek/view_model/post_vm.dart';
import 'package:flutter_uzbek/view_model/them_vm.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

ThemeServiceProvider _themeManager=ThemeServiceProvider();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
   _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener(){
    if(mounted){
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: AuthViewModel(),
          ),
          ChangeNotifierProvider.value(
            value: PostViewModel(),
          ),

           ],

           child:MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: _themeManager.themMode,
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
              )

        );
  }
}
