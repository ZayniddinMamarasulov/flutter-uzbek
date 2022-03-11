import 'package:flutter/material.dart';
import 'package:flutter_uzbek/color/app_color.dart';
class ApppBar extends StatelessWidget {
  const ApppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                height: 24,
                width: 60,
                color: Colors.orange,
                child: TextButton(
                  onPressed: (){

                  },
                  child: Center(
                    child: Text(
                      "PROMO",style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}