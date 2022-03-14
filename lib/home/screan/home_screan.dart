import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uzbek/home/components/articles_widget.dart';
import 'package:flutter_uzbek/home/components/headr_widget.dart';
import 'package:flutter_uzbek/home/components/popular_bannerr.dart';
import 'package:flutter_uzbek/home/components/popular_carusel.dart';
import 'package:flutter_uzbek/home/components/resent_widget.dart';
import 'package:flutter_uzbek/home/components/tab_bar_widget.dart';
import 'package:flutter_uzbek/models/corusel_item.dart';
import 'package:flutter_uzbek/service/app_colors.dart';

class HomeScrean extends StatefulWidget {
  const HomeScrean({Key? key}) : super(key: key);

  @override
  _HomeScreanState createState() => _HomeScreanState();
}

class _HomeScreanState extends State<HomeScrean> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children:  [
        Padding(
          padding: EdgeInsets.all(10),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:  [
                  IconButton(
                    icon: Image.asset('assets/images/person1.png'),
                    onPressed: () {},
                  )
                ],
              ),
              const SizedBox(height: 8,),
              const Text("Home",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,color: Colors.black
              ),),
              const Text("Popular posts",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
              const SizedBox(height: 8,),
              PopularCarousel(),
              const SizedBox(height: 30,),
              const Divider(color: Colors.grey,),
               const SizedBox(height: 12,),
              Container(
                width: 75,
                height: 24,
                decoration: BoxDecoration(
                    color: AppColors.appOrange,
                  borderRadius: BorderRadius.circular(6)
                ),
                child: FlatButton(onPressed: () {  },
                  child: const Center(
                    child: Text("PROMO",style: TextStyle(fontSize: 12,color: AppColors.appWhite),),
                  ),),
              ),
              const SizedBox(height: 12,),
             const HeadrWidget(),
              const SizedBox(height: 12,),
              const Divider(color: Colors.grey,),
              SizedBox(height: 20,),
              ResentWidget(),
              ArticlesWidget()
            ],
          ),
        ),
    ],
    );
  }
}
