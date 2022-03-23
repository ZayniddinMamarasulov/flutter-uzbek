import 'package:easy_localization/easy_localization.dart';
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
        backgroundColor: AppColors.containerFourColor,
        leading:  IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,color: Colors.blue,)
        ),
        title: Text("Popular posts".tr(),style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
        centerTitle: true,
      ),
      body: PopularItem(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[300],
        onPressed: () {

        },
        child: Center(
          child: Image(
            image: AssetImage("assets/icons/arow.png",),
          ),
        ),
      ),
    );
  }
}