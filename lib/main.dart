import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
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
import 'package:flutter_uzbek/view/settings/localithation_page.dart';
import 'package:flutter_uzbek/view/settings/settings_page.dart';
import 'package:flutter_uzbek/view_model/auth_vm.dart';
import 'package:flutter_uzbek/view_model/post_vm.dart';
import 'package:flutter_uzbek/view_model/them_vm.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  SharedPreferences pref = await SharedPreferences.getInstance();
  bool isDark = pref.getBool('darkTheme') ?? false;

  runApp(EasyLocalization(
      supportedLocales: [Locale('uz', 'UZ'), Locale('ru', 'RU'),Locale('en','EN')],
      path: 'assets/lang', // <-- change the path of the translation files
      fallbackLocale: Locale('en', 'EN'),
      saveLocale: true,
      child:MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: AuthViewModel(),
          ),
          ChangeNotifierProvider.value(
            value: PostViewModel(),
          ),
          ChangeNotifierProvider(
          create: (BuildContext context) => ThemeServiceProvider(isDark),)
        ],
        child: const MyApp(),
      ),
  ),);
}



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeServiceProvider>(
      builder: (BuildContext context, value, Widget? child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: value.getTheme(),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          //themeMode: _themeManager.themMode,
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
            SearchPage.id: (context) => SearchPage(),
            LocalithationPage.id: (context) => LocalithationPage(),
          },
        );
      }
    );
  }
}
