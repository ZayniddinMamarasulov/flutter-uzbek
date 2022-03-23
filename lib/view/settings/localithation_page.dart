import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../color/app_color.dart';
class LocalithationPage extends StatefulWidget {
  const LocalithationPage({Key? key}) : super(key: key);
  static final String id="localithation_page";

  @override
  _LocalithationPageState createState() => _LocalithationPageState();
}

class _LocalithationPageState extends State<LocalithationPage> {
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
        title: Text("localization".tr(),style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Row(
        children: [
          TextButton(
              onPressed: (){
                context.setLocale(Locale('uz','UZ'));
              },
              child: Text("uz"),
          ),
          TextButton(
              onPressed: (){
                context.setLocale(Locale('ru','RU'));
              },
              child: Text("ru")
          ),
          TextButton(
              onPressed: (){
                context.setLocale(Locale('en','EN'));
              },
              child: Text("en")
          ),
        ],
      ),
    );
  }
}
