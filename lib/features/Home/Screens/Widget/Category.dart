import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/Constant/Constand.dart';
import '../../../pet/UI/Category/Screens/CategoryView.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(2.0),

          // This next line does the trick.
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            CategoryWidget(
              text: "Cats",
              image: "assets/images/cat.png",
             // color: Color.fromRGBO(181, 173, 202, 1),
            ),
            SizedBox(
              width: 5,
            ),
            CategoryWidget(
              text: "Dogs",
              image: "assets/images/dog.png",
            //  color: Color.fromRGBO(241, 159, 100, 1),
            ),
            SizedBox(
              width: 5,
            ),
            CategoryWidget(
              text: "Fishes",
              image: "assets/images/fish.png",
             // color:  Color.fromRGBO(89, 99, 125, 1),
            ),
            SizedBox(
              width: 5,
            ),
            CategoryWidget(
              text: "Exotic",
              image: "assets/images/ham.png",
             // color: Color.fromRGBO(137, 200, 255, 1),
            ),
            SizedBox(
              width: 5,
            ),
            CategoryWidget(
              text: "Birds",
              image: "assets/images/bird.png",
            ),
            SizedBox(
              width: 5,
            ),
            CategoryWidget(
              text: "Dove",
              image: "assets/images/dove.png",
            ),
            SizedBox(
              width: 5,
            ),
            CategoryWidget(
              text: "Rabit",
              image: "assets/images/rab.png",
            ),
            SizedBox(
              width: 5,
            ),
            CategoryWidget(
              text: "Cow",
              image: "assets/images/cov.png",
            ),
            SizedBox(
              width: 5,
            ),
            CategoryWidget(
              text: "Goat",
              image: "assets/images/aad.png",
            ),
            SizedBox(
              width: 5,
            ),
            CategoryWidget(
              text: "Accessories",
              image: "assets/images/accessories.png",
            ),
            SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key key,
    this.image,
    this.text,
    this.imageheight,
    this.imagewidth,
   
  }) : super(key: key);
  final String image;

  final String text;
  final double imageheight;
  final double imagewidth;
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryView(
                      category: text,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            color: purple),
        width: MediaQuery.of(context).size.width * 0.2,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  text,
                  style: GoogleFonts.yanoneKaffeesatz(
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      color: Colors.white),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
