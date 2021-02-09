import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:hive/hive.dart';
import 'package:latlng/latlng.dart';
import 'package:petapp/core/location/get_location.dart';
import 'package:petapp/features/Home/location/ui/SearchLocation/ui/searchLocation.dart';
import 'package:petapp/features/Home/location/ui/category/ui/Districtlocation.dart';

import '../../../core/Constant/Constand.dart';
import '../../Home/Screens/Home/Home.dart';

class LocationUI extends StatefulWidget {
  final bool home;

  const LocationUI({
    Key key,
    this.home,
  }) : super(key: key);
  @override
  _LocationUIState createState() => _LocationUIState();
}

class _LocationUIState extends State<LocationUI> {
  Address address; //f
  LatLng coordinates;
  LatLng _center;

  // Timer _timer;
  // FlutterLogoStyle _logoStyle = FlutterLogoStyle.markOnly;
  bool show = false;
  bool button = false;

  @override
  void initState() {
    initPlatformState();
    super.initState();
  }

  initPlatformState() async {
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
    List location = [
      "Thiruvananthapuram",
      "Kollam",
      "Alappuzha",
      "Pathanamthitta",
      "Kottayam",
      "Idukki",
      "Ernakulam",
      "Thrissur",
      "Palakkad",
      "Malappuram",
      "Kozhikode",
      "Wayanad",
      "Kannur",
      "Kasargod",
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purple,
        title: Text("Location"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchLocationUI()));
                },
                child: TextField(
                  readOnly: true,
                  decoration: new InputDecoration(
                    filled: true,
                    enabled: false,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    hintText: "Search city,area or place",
                    hintStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Hive.box('location').clear().then((value) {
                  setState(() {
                    if (!widget.home) {
                      Hive.box('location')
                          .put("latitude", coordinates.latitude);
                      Hive.box('location')
                          .put("longitude", coordinates.longitude);
                      Hive.box('location').put("locationName",
                          address.featureName + "," + address.locality);
                    } else {
                      Hive.box('location').put(
                        "latitude",
                        Hive.box('location').get("latitude"),
                      );
                      Hive.box('location').put(
                        "longitude",
                        Hive.box('location').get("longitude"),
                      );
                      Hive.box('location').put(
                        "locationName",
                        Hive.box('location').get("locationName"),
                      );
                    }
                  });
                }).then((value) => Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home())));
              },
              child: ListTile(
                leading: Icon(
                  Icons.gps_fixed,
                  size: 35,
                  color: Colors.blue,
                ),
                title: Text(
                  "Use current location",
                  style: TextStyle(color: Colors.blue),
                ),
                subtitle: Text(
                  widget.home
                      ? Hive.box('location').get(
                          "locationName",
                        )
                      : address.featureName + "," + address.locality,
                ),
              ),
            ),
            Container(
                color: Colors.grey.shade300,
                width: MediaQuery.of(context).size.width,
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Choose Place"),
                )),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.66,
                child: ListView.separated(
                    shrinkWrap: true,
                    //scrollDirection: Axis.vertical,
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: location.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DistrictLocation(
                                          category: location[index],
                                        )));
                          },
                          child: Text(
                            location[index],
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
