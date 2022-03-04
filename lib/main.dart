import 'package:flutter/material.dart';
import 'package:flutter_uzbek/view/components/popular_item.dart';
import 'package:flutter_uzbek/view/home_page.dart';
import 'package:flutter_uzbek/view/my_proil_page.dart';
import 'package:flutter_uzbek/view/popular_posts_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        MyProfilPage.id: (context)=>MyProfilPage(),
        PopularItem.id: (context)=>PopularItem(),
        PopularPostsPAge.id: (context)=>PopularPostsPAge()
      },
    );
  }
}


