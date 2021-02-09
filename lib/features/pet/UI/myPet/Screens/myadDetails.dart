import 'dart:io';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../core/Constant/API_Constants.dart';
import '../../../../../core/Constant/Constand.dart';
import '../../../../../core/config/api_config.dart';
import '../../../../Home/Screens/Home/Home.dart';
import '../../../../Widget/DescriptionBox.dart';
import '../../../../Widget/ImageViewBox.dart';
import '../../../../Widget/Share_Button.dart';
import '../../../domain/entity/pet.dart';
import 'myAdEdit.dart';

class MyAdDetails extends StatefulWidget {
  final Pet pet;
  final ApiConfig apiConfig;
  const MyAdDetails({
    Key key,
    this.pet,
    this.apiConfig,
  }) : super(key: key);

  @override
  _MyAdDetailsState createState() => _MyAdDetailsState();
}

class _MyAdDetailsState extends State<MyAdDetails> {
  // VideoPlayerController _controller;

  // ignore: unused_field
  Future<void> _initializeVideoPlayerFuture;

  File videoThumbNail;

  void initState() {
    //ss  getVideoThumbNail();
    // print("###########################################");
    // print(widget.phone);
    // _controller = VideoPlayerController.network(
    //   widget.pet.video,
    // );
    // _initializeVideoPlayerFuture = _controller.initialize();
    // _controller.setLooping(true);
    super.initState();
    //String duration = _controller.value.duration;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: purple,
          actions: [
            ShareButton(
              image: widget.pet.photo1,
              name: widget.pet.petName,
              amount: widget.pet.amount,
              username: widget.pet.userName,
            ),
            IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (contex) => MyAdEdit(
                            pet: widget.pet,
                            apiConfig: widget.apiConfig,
                          )));
                }),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () => widget.apiConfig
                    .deletePost(
                        endpoint: ApiEndpoints.petDeleteUpdate(widget.pet.id))
                    .then((value) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (contex) => Home()));
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Success"),
                          content: Text("Post was uploaded successfully"),
                          actions: [
                            FlatButton(
                              child: Text(
                                "OK",
                                style: TextStyle(
                                    color: Constants.themeGradients[0]),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        );
                      });
                }),
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
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
                    // else if (widget.pet.video == null)
                    //   Container(
                    //     child: Center(
                    //       child: YoYoPlayer(
                    //         aspectRatio: 16 / 9,
                    //         url: widget.pet.video,
                    //         videoStyle: VideoStyle(
                    //           play: Icon(Icons.play_arrow),
                    //           pause: Icon(Icons.pause),
                    //           fullscreen: Icon(Icons.fullscreen),
                    //           forward: Icon(Icons.skip_next),
                    //           backward: Icon(Icons.skip_previous),
                    //         ),
                    //         videoLoadingStyle: VideoLoadingStyle(),
                    //       ),
                    //     ),
                    //   ),
                  ],
                ),
              ),
              DescriptionBox(pet: widget.pet),
            ],
          ),
        ));
  }
}
