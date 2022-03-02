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
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Goa', textScaleFactor: 1),
              background: Image.asset(
                'assets/images/beach.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          //3
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                return ListTile(
                  leading: Container(
                      padding: EdgeInsets.all(8),
                      width: 100,
                      child: Placeholder()),
                  title: Text('Place ${index + 1}', textScaleFactor: 2),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

