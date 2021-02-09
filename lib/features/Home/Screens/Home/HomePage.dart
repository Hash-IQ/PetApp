import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:hive/hive.dart';
import 'package:latlng/latlng.dart';

import '../../../../core/Constant/Constand.dart';
import '../../../../core/location/get_location.dart';
import '../../../Widget/Screens/LocationUI.dart';
import '../../../pet/UI/getPet/Screens/CardItemView.dart';
import '../../../pet/UI/search/UI/SearchUI.dart';
import '../Widget/Category.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController locationController = TextEditingController();
  Coordinates coordinates;
  Address address; //from geocoder package
  String location;
  @override
  void initState() {
    location = Hive.box("location").get("locationName");

    print("##################################");
    print(location);
    initPlatformState();
    super.initState();
  }

  initPlatformState() async {
    // Coordinates coord = await getUserCoordinates();
    LatLng add = await getUserLocation();
    print(add.latitude.toString());
    setState(() {
      //  address = add;
      // coordinates = coord;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchUI(),
                    ));
              },
              child: TextFormField(
                style: textfield1,
                decoration: new InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                    hintText: "Find Cats,Dogs,Birds.......",
                    hintStyle: textfield1,
                    filled: true,
                    enabled: false,
                    fillColor: Colors.white,
                    border: form,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 25,
                    ),
                    enabledBorder: form,
                    focusedBorder: form),
              ),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: purple,
        title: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.white,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LocationUI(
                        home: true,
                      ),
                    ),
                  );
                },
                child: Text(
                  location,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(
              Icons.notifications,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [Container(child: CategoryTitle()), CardItemView()],
      )),
    );
  }
}
