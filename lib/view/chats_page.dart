import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uzbek/color/app_color.dart';
import 'package:flutter_uzbek/model/user_model.dart';

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
      appBar: AppBar(
        backgroundColor: AppColors.containerFiveColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Chats",style: TextStyle(color: Colors.black,fontSize: 32,fontWeight: FontWeight.w700),),
            Container(
              height: 36,
              width: double.infinity,
              child: CupertinoTextField(
                keyboardType: TextInputType.text,
                placeholder: 'Search',
                placeholderStyle:const TextStyle(
                  color: Color(0xffC4C6CC),
                  fontSize: 14.0,
                  fontFamily: 'Brutal',
                ),
                prefix: const Padding(
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
            )
          ],
        ),
        toolbarHeight: 100,
      ),
      body: ListView.builder(
          itemCount: User.user.length,
          itemBuilder: (BuildContext contex,int index){
            return Chats(User.user[index]);
          }
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          child: Center(
            child: ImageIcon(
                AssetImage('assets/icons/writing.png')
            ),
          )
      ),
    );

  }

  Widget Chats(User user){
    return InkWell(
      onTap: (){
        setState(() {

        });
      },
      child: Container(
        height: 85,
        width: double.infinity,
        padding: EdgeInsets.only(left: 22,top: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.black
              ),
              child: Image(image: AssetImage(user.image)),
            ),
            SizedBox(width: 12,),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.name,style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                  Text(user.message,style: TextStyle(color: Colors.grey,fontSize: 17,fontWeight: FontWeight.w400),)
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Text(user.data)
            )
          ],
        ),
      ),

    );
  }

}
