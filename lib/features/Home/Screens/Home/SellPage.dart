import 'package:flutter/material.dart';

import '../../../../core/Constant/Constand.dart';
import '../../../pet/UI/pet/UI/Sell/SellDataForm.dart';

class SellPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purple,
        title: Text(
          "What Are You Selling ?",
          style: appHead,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SellWidget(
              height1: deviceSize.height * 0.07,
              image1: "assets/images/cat.png",
              text1: "Cats",
              height2: deviceSize.height * 0.07,
              image2: "assets/images/dog.png",
              text2: "Dogs",
            ),
            Container(
              width: double.maxFinite,
              height: 1,
              color: Colors.grey,
            ),
            SellWidget(
              height1: deviceSize.height * 0.07,
              image1: "assets/images/fish.png",
              text1: "Fishes",
              height2: deviceSize.height * 0.07,
              image2: "assets/images/bird.png",
              text2: "Birds",
            ),
            Container(
              width: double.maxFinite,
              height: 1,
              color: Colors.grey,
            ),
            SellWidget(
              height1: deviceSize.height * 0.07,
              image1: "assets/images/dove.png",
              text1: "Dove",
              height2: deviceSize.height * 0.07,
              image2: "assets/images/ham.png",
              text2: "Exotic",
            ),
            Container(
              width: double.maxFinite,
              height: 1,
              color: Colors.grey,
            ),
            SellWidget(
              height1: deviceSize.height * 0.07,
              image1: "assets/images/rab.png",
              text1: "Rabit",
              height2: deviceSize.height * 0.07,
              image2: "assets/images/aad.png",
              text2: "Goat",
            ),
            Container(
              width: double.maxFinite,
              height: 1,
              color: Colors.grey,
            ),
            SellWidget(
              height1: deviceSize.height * 0.07,
              image1: "assets/images/cov.png",
              text1: "Cow",
              height2: deviceSize.height * 0.07,
              image2: "assets/images/accessories.png",
              text2: "Accessories",
            ),
            Container(
              width: double.maxFinite,
              height: 1,
              color: Colors.grey,
            ),
          ],
        ),
      )),
    );
  }
}

class SellWidget extends StatelessWidget {
  const SellWidget({
    Key key,
    this.text1,
    this.height1,
    this.image1,
    this.text2,
    this.height2,
    this.image2,
  }) : super(key: key);
  final String text1;
  final String image1;
  final double height1;
  final String text2;
  final String image2;
  final double height2;

  @override
  Widget build(BuildContext context) {
    //   final deviceSize = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SellDataForm(
                          category: text1,
                        )),
              );
            },
            child: SellContainer(
              height: height1,
              text: text1,
              image: image1,
            ),
          ),
        ),
        Container(
          width: 1,
          height: MediaQuery.of(context).size.height * 0.11,
          color: Colors.grey,
        ),
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () {
              text2 == "Accessories"
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SellDataForm(
                                category: text2,
                              )),
                    )
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SellDataForm(
                                category: text2,
                              )),
                    );
            },
            child: SellContainer(
              height: height2,
              text: text2,
              image: image2,
            ),
          ),
        ),
      ],
    );
  }
}

class SellContainer extends StatelessWidget {
  const SellContainer({Key key, this.image, this.text, this.height})
      : super(key: key);
  final String text;
  final String image;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.11,
      width: MediaQuery.of(context).size.width * 0.1,
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: height,
            ),
            Text(
              text,
              style: text2,
            )
          ],
        ),
      ),
    );
  }
}
