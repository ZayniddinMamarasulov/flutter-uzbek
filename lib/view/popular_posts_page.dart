import 'package:flutter/material.dart';
import 'package:flutter_uzbek/color/app_color.dart';
import 'package:flutter_uzbek/view/components/popular_item.dart';
class PopularPostsPAge extends StatefulWidget {
  const PopularPostsPAge({Key? key}) : super(key: key);
  static final String id="popular_posts_page";

  @override
  _PopularPostsPAgeState createState() => _PopularPostsPAgeState();
}

class _PopularPostsPAgeState extends State<PopularPostsPAge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.containerFiveColor,
        title: Row(
          children: [
            TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios),
                    Text("Back",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w600),)
                  ],
                )
            ),
            SizedBox(width: 30,),
            Text("Popular posts",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: PopularItem(),
      ),
    );
  }
}
