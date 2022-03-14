import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uzbek/models/corusel_item.dart';
import 'package:flutter_uzbek/service/app_colors.dart';

class PopularBanner extends StatefulWidget {
  final CarouselItem item;
  final int currentIndex;
  final CarouselController carouselController;

  const PopularBanner(
      {Key? key,
        required this.carouselController,
        required this.item,
        required this.currentIndex})
      : super(key: key);

  @override
  _PopularBannerState createState() => _PopularBannerState();
}

class _PopularBannerState extends State<PopularBanner> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
       _bannerBackgroundGradient(context),
      Container(
        margin: const EdgeInsets.only(right: 12),
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                widget.item.title,
                style:
                const TextStyle(fontSize: 24, fontWeight: FontWeight.w900,color: AppColors.appWhite),
              ),
              const SizedBox(height: 30.0),
              Text(
                widget.item.title2,
                style:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: AppColors.appWhite),
              ),

            ],
          ),
        ),
      ),
    ]);
  }

  Container _bannerBackgroundGradient(BuildContext context) {
    return Container(
       margin: const EdgeInsets.only(right: 12),
       width: MediaQuery
          .of(context)
          .size
         .width,

      height: 220,
      decoration: BoxDecoration(
        color: AppColors.orenge,
        borderRadius: BorderRadius.circular(28),
      ),
    );
  }

}
//

