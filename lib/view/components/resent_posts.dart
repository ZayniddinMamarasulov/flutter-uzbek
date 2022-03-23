import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uzbek/color/app_color.dart';
class RecentPosts extends StatefulWidget {
  const RecentPosts({Key? key}) : super(key: key);

  @override
  _RecentPostsState createState() => _RecentPostsState();
}

class _RecentPostsState extends State<RecentPosts> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Recent posts".tr()),
              Row(
                children: [
                  TextButton(
                      onPressed: (){

                      },
                      child: Row(
                        children: [
                          Text("See all".tr(),style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w600),),
                          Icon(Icons.arrow_forward_ios,color: Colors.blue,)
                        ],
                      )
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 16,),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.blue
            ),
            child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Recent\narticle title".tr(),style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w700),),
                        SizedBox(height: 8,),
                        Text("Short text\ndescription".tr(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: Colors.white),),
                        SizedBox(height: 36,),
                        Row(
                          children: [
                            Image(image: AssetImage("assets/icons/image9.png")),
                            Text("John Doe",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: Colors.white),)
                          ],
                        )
                      ],
                    ),
                    Image(image: AssetImage("assets/icons/img5.png"))
                  ],
                )
            ),
          ),
          SizedBox(height: 8,),
          Container(
            height: 200,
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  height: 200,
                  width: 140,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.containerFiveColor
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 16,left: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Popular article\ntitle".tr(),style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w700),),
                        SizedBox(height: 8,),
                        Text("Short text\ndescription".tr(),style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w400),),
                        SizedBox(height: 25,),
                        Row(
                          children: [
                            Image(image: AssetImage("assets/icons/image7.png")),
                            SizedBox(width: 6,),
                            Text("John Doe",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8,),
                Expanded(
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.containerFiveColor
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 16,left: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Popular article\ntitle".tr(),style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w700),),
                          SizedBox(height: 8,),
                          Text("Short text\ndescription".tr(),style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w400),),
                          SizedBox(height: 25,),
                          Row(
                            children: [
                              Image(image: AssetImage("assets/icons/image8.png")),
                              SizedBox(width: 6,),
                              Text("John Doe",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w400),)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}