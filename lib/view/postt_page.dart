import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uzbek/model/service.dart';


import '../color/app_color.dart';
class PosttPage extends StatefulWidget {
  const PosttPage({Key? key}) : super(key: key);
  static final String id='postt_page';

  @override
  _PosttPageState createState() => _PosttPageState();
}

class _PosttPageState extends State<PosttPage> {
  @override
  Widget build(BuildContext context) {
    final args=ModalRoute.of(context)!.settings.arguments as Map<String,Infor>;
    Infor?  infor=args["infor"];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.containerFourColor,
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Image(
              image: AssetImage('assets/icons/back.png'),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  width: double.infinity,
                  image: AssetImage('assets/icons/saly.png'),fit: BoxFit.cover,),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Image(image: AssetImage('assets/icons/image9.png')),
                      Text(infor!.name),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(infor.text,style: TextStyle(color: Colors.black,fontSize: 32,fontWeight: FontWeight.w700),
                    )
                ),
                SizedBox(height: 32,),
                Container(
                  height: 2,
                  color: Colors.grey,
                ),
                Text(infor.text,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w700),),
                SizedBox(height: 8,),
                Text(infor.batafsil,style: TextStyle(color: Colors.grey,fontSize: 17,fontWeight: FontWeight.w400),)
              ],
            ),
          ),
        )
    );
  }
}