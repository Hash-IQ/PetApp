import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/Constant/Constand.dart';
import '../../injection_container.dart';
import '../pet/UI/myPet/Screens/myadDetails.dart';
import '../pet/domain/entity/pet.dart';

class MyCard extends StatelessWidget {
  final String petName;
  final String amount;

  final String location;
  final bool saled;
  final DateTime createddate;
  final String photo1;
  final int id;
  final bool search;
  final Pet pet;
  const MyCard({
    Key key,
    this.petName,
    this.amount,
    this.location,
    this.saled,
    this.createddate,
    this.photo1,
    this.id,
    this.search,
    this.pet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
              height: 170.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 150),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      //  width: 120.0,
                      child: Text(
                        petName,
                        style: GoogleFonts.yanoneKaffeesatz(
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Text(
                      '\₹$amount',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    !search
                        ? Align(
                            alignment: Alignment.center,
                            child: RaisedButton(
                              color: purple,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyAdDetails(
                                        pet: pet,
                                        apiConfig: sl(),
                                      ),
                                    ));
                              },
                              child: Text(
                                "View",
                                style: Constants.titleButton,
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 20.0,
              top: 15.0,
              bottom: 15.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  photo1,
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ));
  }
}
