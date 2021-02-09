import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Imageslider extends StatelessWidget {
  const Imageslider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          initialPage: 0,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          autoPlay: true,
          reverse: false,
          enableInfiniteScroll: true,
          autoPlayInterval: Duration(seconds: 2),
          autoPlayAnimationDuration: Duration(milliseconds: 2000),
        ),
        items: [
          Image.asset(
            'assets/images/pet1.png',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/images/pets2.png',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/images/pet3.png',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
