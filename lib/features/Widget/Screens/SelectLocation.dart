import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlng/latlng.dart';

import '../../../core/Constant/Constand.dart';
import '../../../core/location/get_location.dart';
import 'LocationUI.dart';

class SelectLocation extends StatefulWidget {
  @override
  _SelectLocationState createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  Address address; //f
  LatLng coordinates;
  LatLng _center;
  Position currentLocation;
  // Timer _timer;
  // FlutterLogoStyle _logoStyle = FlutterLogoStyle.markOnly;
  bool show = false;
  bool button = false;

  @override
  void initState() {
    initPlatformState();
    Timer(const Duration(seconds: 6), () {
      setState(() {
        // _logoStyle = FlutterLogoStyle.horizontal;
        show = true;
      });
    });
    Timer(const Duration(seconds: 10), () {
      setState(() {
        // _logoStyle = FlutterLogoStyle.horizontal;
        button = true;
        // print(coordinates.toString());
        // print(address.featureName);
      });
    });
    super.initState();
  }

  initPlatformState() async {
    // Coordinates coord = await getUserCoordinates();
    LatLng latLng = await getUserLocation();
    Address add = await getUserLocationname();
    print(latLng.latitude.toString());
    print(add.featureName);
    setState(() {
      address = add;
      coordinates = latLng;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Container(
                  height: 200,
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: FlareActor(
                    "assets/map_path.flr",
                    shouldClip: false,
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.contain,
                    animation: "Show",

                    //   controller: _teddyController,
                  ))),
          SizedBox(
            height: 20,
          ),
          show
              ? Column(
                  children: [
                    Text(
                      "Where do you want",
                      style: titl,
                    ),
                    Text("to buy/sell pets?", style: titl)
                  ],
                )
              : Container(),
          SizedBox(
            height: 20,
          ),
          button
              ? GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LocationUI(
                                  home: false,
                                )));
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.green,
                    ),
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                        color: purple,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Select Location',
                          textScaleFactor: 2,
                          style: buttonloc,
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
          SizedBox(
            height: 10,
          ),
          // button
          //     ? GestureDetector(
          //         onTap: () {
          //           Navigator.pushReplacement(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => LocationUI(
          //                         address: address,
          //                       )));
          //         },
          //         child: Container(
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.all(
          //               Radius.circular(10.0),
          //             ),
          //             color: purple,
          //           ),
          //           child: Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Icon(
          //               Icons.arrow_forward,
          //               color: Colors.white,
          //               size: 25,
          //             ),
          //           ),
          //         ),
          //       )
          //     : Container()
        ],
      )),
    );
  }
}
