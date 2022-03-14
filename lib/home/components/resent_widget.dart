import 'package:flutter/material.dart';
import 'package:flutter_uzbek/service/app_colors.dart';

class ResentWidget extends StatefulWidget {
  const ResentWidget({Key? key}) : super(key: key);

  @override
  _ResentWidgetState createState() => _ResentWidgetState();
}

class _ResentWidgetState extends State<ResentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.all(12),
           height: 224,
           width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.appblue,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:    [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Text('Recent ',style: TextStyle(fontWeight: FontWeight.w700,color: AppColors.appWhite,fontSize: 24),),
                      const Text("article title",style:TextStyle(fontWeight: FontWeight.w700,color: AppColors.appWhite,fontSize: 24)),
                      const SizedBox(height: 12,),
                      const Text("Short text",style:TextStyle(fontWeight: FontWeight.w400,color: AppColors.appWhite,fontSize:17)),
                      const Text("Description",style:TextStyle(fontWeight: FontWeight.w400,color: AppColors.appWhite,fontSize:17)),
                      SizedBox(height: 56,),
                      Row(
                        children: const [
                          Image(image: AssetImage('assets/images/sticer.png'),),
                          SizedBox(width: 8,),
                          Text("John Doe",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.black),),
                        ],
                      )
                    ],
                  ),
                  SizedBox(width: 20,),
                  const Image(image: AssetImage('assets/images/person_2.png'),),
                ],
              ),


    ],
          ),
        ),
      ),
    );
  }
}
