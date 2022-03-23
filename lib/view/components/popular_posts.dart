import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uzbek/color/app_color.dart';
import 'package:flutter_uzbek/view/components/promo.dart';
import 'package:flutter_uzbek/view/components/promo_header.dart';
import 'package:flutter_uzbek/view/components/resent_posts.dart';
import 'package:flutter_uzbek/view/popular_posts_page.dart';
class PopularPost extends StatefulWidget {
  const PopularPost({Key? key}) : super(key: key);

  @override
  _PopularPostState createState() => _PopularPostState();
}

class _PopularPostState extends State<PopularPost> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Popular posts".tr()),
                    Row(
                      children: [
                        TextButton(
                            onPressed: (){
                              Navigator.pushNamed(context, PopularPostsPAge.id);
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
              ),
              Container(
                margin: const EdgeInsets.only(left: 20,top: 10),
                height: 200.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, PopularPostsPAge.id);
                      },
                      child: Container(
                        height: 180,
                        width: 188,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.containerOneColor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 16,left: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Popular article\ntitle".tr(),style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),),
                              SizedBox(height: 8,),
                              Text("Short text\ndescription".tr(),style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w400),),
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
                    ),
                    SizedBox(width: 8,),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, PopularPostsPAge.id);
                      },
                      child: Container(
                        height: 180,
                        width: 188,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.containerTwoColor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 16,left: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Popular article\ntitle".tr(),style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700),),
                              SizedBox(height: 8,),
                              Text("Short text\ndescription".tr(),style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w400),),
                              SizedBox(height: 25,),
                              Row(
                                children: [
                                  Image(image: AssetImage("assets/icons/image8.png")),
                                  SizedBox(width: 6,),
                                  Text("John Doe",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w400),)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ApppBar(),
              PromoHeader(),
              RecentPosts()
            ]
        )
    );
  }
}
