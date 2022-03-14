import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uzbek/home/components/popular_bannerr.dart';
import 'package:flutter_uzbek/service/static_data.dart';


class PopularCarousel extends StatefulWidget {
  PopularCarousel({Key? key}) : super(key: key);

  @override
  _PopularCarouselState createState() => _PopularCarouselState();
}

class _PopularCarouselState extends State<PopularCarousel> {
  int currentIndex = 0;
  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CarouselSlider.builder(
        carouselController: controller,
        itemCount: 2,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          return PopularBanner(
            carouselController: controller,
            item: StaticData.popularBanners[itemIndex],
            currentIndex: currentIndex,
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          onPageChanged: (index, _) {
            setState(() {
              currentIndex = index;
            });
          },
          viewportFraction: 0.7,
          initialPage: 2,
          height: 250.0,
          enableInfiniteScroll: false,
        ),
      ),
    );
  }
}
