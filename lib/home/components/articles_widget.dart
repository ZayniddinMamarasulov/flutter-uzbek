
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uzbek/service/app_colors.dart';

class ArticlesWidget extends StatelessWidget {


  const ArticlesWidget({Key? key,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              height: 224,
              decoration: BoxDecoration(
                color: AppColors.appgrey,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                   const Text("Recent",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 21,color: AppColors.black),),
                  SizedBox(height: 8,),
                  const Text("article",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 21,color: AppColors.black),),
                  SizedBox(height: 8,),
                  Text("title",style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 21,color: AppColors.black),),
                  SizedBox(height: 8,),
                  Text("Short text",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 21,color: AppColors.grey),),
                  SizedBox(height: 8,),
                  Text("description",style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 21,color: AppColors.grey),),
                  SizedBox(height: 8,),
                  Row(
                    children: const [
                      Image(image: AssetImage('assets/images/sticer_1.png'),),
                      SizedBox(width: 8,),
                      Text("John Doe",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.black),),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(width: 12,),
            Container(
              padding: const EdgeInsets.all(20),
              height: 224,
              decoration: BoxDecoration(
                  color: AppColors.appgrey,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Recent article",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: AppColors.black),),
                        SizedBox(height: 10,),
                        Text("title",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 22,color: AppColors.black),),
                        SizedBox(height: 10,),
                        Text("Short text",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22,color: AppColors.grey),),
                        SizedBox(height: 10,),
                        Text("description",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: AppColors.grey),),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                  Row(
                    children: const [
                      Image(image: AssetImage('assets/images/sticer_2.png'),),
                      SizedBox(width: 8,),
                      Text("John Doe",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: AppColors.black),),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
