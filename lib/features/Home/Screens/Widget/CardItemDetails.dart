import 'dart:io';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/Constant/Constand.dart';
import '../../../Widget/DescriptionBox.dart';
import '../../../Widget/ImageViewBox.dart';
import '../../../Widget/Share_Button.dart';
import '../../../pet/domain/entity/pet.dart';
import 'FloatingActionButtonD.dart';

class CardItemDetails extends StatefulWidget {
  final Pet pet;

  const CardItemDetails({Key key, this.pet}) : super(key: key);

  @override
  _CardItemDetailsState createState() => _CardItemDetailsState();
}

class _CardItemDetailsState extends State<CardItemDetails> {


  // ignore: unused_field
  Future<void> _initializeVideoPlayerFuture;

  File videoThumbNail;

  void initState() {
    //ss  getVideoThumbNail();
    print("###########################################");
    print(widget.pet.phone);

    super.initState();
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height,
                        initialPage: 0,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        autoPlay: false,
                        reverse: true,
                        enableInfiniteScroll: true,
                      ),
                      items: [
                        ImageViewSlide(
                          image: widget.pet.photo1,
                        ),
                        ImageViewSlide(
                          image: widget.pet.photo2,
                        ),
                        if (widget.pet.photo3 != null)
                          ImageViewSlide(
                            image: widget.pet.photo3,
                          )
                        else if (widget.pet.photo4 != null)
                          ImageViewSlide(
                            image: widget.pet.photo4,
                          )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: purple,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          iconSize: 25.0,
                          color: Colors.white,
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: purple,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ShareButton(
                          image: widget.pet.photo1,
                          name: widget.pet.petName,
                          amount: widget.pet.amount,
                          username: widget.pet.userName,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: DescriptionBox(pet: widget.pet)),
          FloatingActionButtonD(
            phone: widget.pet.phone,
          ),
        ],
      ),
    ));
  }
}
