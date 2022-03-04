import 'package:flutter/cupertino.dart';
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
            slivers: [
              SliverAppBar(
                expandedHeight: 160,
                automaticallyImplyLeading: false,
                pinned: true,
                titleSpacing: 0,
                elevation: 1.0,
                backgroundColor: AppColors.containerFourColor,
                title: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text("Chats",style: TextStyle(color: Colors.black,fontSize: 32,fontWeight: FontWeight.w700),),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 70.0),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
                          child: Container(
                            height: 36.0,
                            width: double.infinity,
                            child: CupertinoTextField(
                              keyboardType: TextInputType.text,
                              placeholder: 'Search',
                              placeholderStyle: TextStyle(
                                color: Color(0xffC4C6CC),
                                fontSize: 14.0,
                                fontFamily: 'Brutal',
                              ),
                              prefix: Padding(
                                padding:
                                const EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
                                child: Icon(
                                  Icons.search,
                                  color: Color(0xffC4C6CC),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Color(0xffF0F1F5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                    ],
                  )
              )
            ]
        )
    );
  }
}

