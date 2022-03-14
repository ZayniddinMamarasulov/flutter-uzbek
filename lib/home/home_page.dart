import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uzbek/chat/chat_page.dart';
import 'package:flutter_uzbek/home/components/popular_carusel.dart';
import 'package:flutter_uzbek/home/screan/home_screan.dart';
import 'package:flutter_uzbek/models/corusel_item.dart';

import 'components/popular_bannerr.dart';
import 'components/tab_bar_widget.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
    static const List<Widget> _widgetOptions = <Widget>[
   HomeScrean(),
    ChatPage(),
    Text(
      'Index 2: School',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
        ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_sharp),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.post_add_sharp),
                label: 'My Posts',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            onTap: _onItemTapped,
          )
    );
  }
}
