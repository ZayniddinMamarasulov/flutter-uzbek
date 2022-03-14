import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uzbek/color/app_color.dart';
import 'package:flutter_uzbek/view/chats_page.dart';
import 'package:flutter_uzbek/view/post_page.dart';
import 'package:flutter_uzbek/view/profil_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentTab = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [ProfilPage(), ChatsPage(), PostPage()],
        onPageChanged: (int index) {
          setState(() {
            _currentTab = index;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        onTap: (int index) {
          _currentTab = index;
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 200), curve: Curves.easeIn);
        },
        currentIndex: _currentTab,
        activeColor: AppColors.bottomNavigation,
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/icons/img1.png"),
                size: 32,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/icons/img2.png"),
                size: 32,
              ),
              label: "Chats"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/icons/img3.png"),
                size: 32,
              ),
              label: "My post"),
        ],
      ),
    );
  }
}
