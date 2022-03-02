import 'package:flutter/material.dart';
import 'package:flutter_uzbek/color/app_color.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);
  static final String id="chat_page";

  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          //2
          SliverAppBar(
            pinned: true,
            expandedHeight: 88,
            backgroundColor: AppColors.containerFiveColor,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Chats',style: TextStyle(color: Colors.black), textScaleFactor: 1),
            ),
          ),
          //3
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  height: 24,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.containerFiveColor
                  ),
                  child: Center(child: Text("Now")),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}

