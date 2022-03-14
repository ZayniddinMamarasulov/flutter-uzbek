import 'package:flutter/material.dart';
import 'package:flutter_uzbek/color/app_color.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: AppColors.containerFiveColor,
    elevation: 0,
    leading: IconButton(
      onPressed: (){
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back_ios,color: Colors.blue,),
    )
  );
}
