import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/Constant/Constand.dart';

class CardItem extends StatelessWidget {
  final String image;
  final String location;
  final String amount;
  final String petName;

  const CardItem(
      {Key key, this.image, this.location, this.amount, this.petName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width * 0.4,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            bottom: 10.0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.5,
            
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                    decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          " ₹" + amount,
                          style: text2,
                        ),
                        Text(
                          " " + petName,
                          style: GoogleFonts.yanoneKaffeesatz(
                              fontSize: 18,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.blueAccent,
                              size: 15,
                            ),
                            Expanded(
                              child: Text(
                                location,
                                overflow: TextOverflow.ellipsis,
                                style: text2,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 2.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Stack(
              children: <Widget>[
                Hero(
                  tag: image,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      image,
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.4,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          )
          
        ],
      ),
    );

    //  Card(
    //   child: Padding(
    //     padding: const EdgeInsets.all(5.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Center(
    //           child:Image.network(
    //               image,
    //               height: MediaQuery.of(context).size.height * 0.2,
    //               width: MediaQuery.of(context).size.width * 0.4,
    //               fit: BoxFit.cover,
    //             ),
    //         ),
    // Text(
    //   " ₹" + amount,
    //   style: text2,
    // ),
    // Text(
    //   " "+petName,
    //   style:  GoogleFonts.yanoneKaffeesatz(
    //           fontSize: 18,
    //           fontStyle: FontStyle.normal,
    //           fontWeight: FontWeight.bold,
    //           color: Colors.black),
    // ),
    //         SizedBox(
    //           height: 10,
    //         ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //         Icon(
    //           Icons.location_on,
    //           color: Colors.blueAccent,
    //           size: 15,
    //         ),
    //         Expanded(
    //           child: Text(
    //             location,
    //             overflow: TextOverflow.ellipsis,
    //             style: text2,
    //           ),
    //         )
    //       ],
    //     ),
    //   ],
    // ),
    //   ),
    // );
  }
}
