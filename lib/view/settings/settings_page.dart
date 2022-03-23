import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uzbek/color/app_color.dart';

import 'localithation_page.dart';
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  static final String id="search_page";

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.containerFiveColor,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,color: Colors.blue,),
        ),
        title: Text("Setting".tr(),style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, LocalithationPage.id);
              },
              child: Container(
                height: 50,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("localization".tr(),style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),)
                  ],
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
