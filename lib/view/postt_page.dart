import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uzbek/model/my_post_model.dart';
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
    final args=ModalRoute.of(context)!.settings.arguments as Map<String,MyPosts>;
    MyPosts?  post=args["post"];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.containerFourColor,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,color: Colors.blue,),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 20,top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(post!.imageUrl.toString()),
                // Image(
                //   width: double.infinity,
                //   image: AssetImage('assets/icons/saly.png'),fit: BoxFit.cover,),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                     // Image(image: AssetImage('assets/icons/image9.png')),
                      //Text(post!.title.toString()),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(post.title.toString(),style: TextStyle(color: Colors.black,fontSize: 32,fontWeight: FontWeight.w700),
                    )
                ),
                SizedBox(height: 32,),
                Container(
                  height: 2,
                  color: Colors.grey,
                ),
                Text(post.title.toString(),style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w700),),
                SizedBox(height: 8,),
                Text(post.text.toString(),style: TextStyle(color: Colors.grey,fontSize: 17,fontWeight: FontWeight.w400),)
              ],
            ),
          ),
        )
    );
  }
}