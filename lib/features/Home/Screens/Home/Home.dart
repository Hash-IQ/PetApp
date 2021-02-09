import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';

import '../../../../core/Constant/Constand.dart';
import '../../../Widget/Screens/addPhoneNumber.dart';
import '../../../pet/UI/myPet/Screens/MyAds.dart';
import '../Widget/Color_Circle.dart';
import 'Account.dart';
import 'ChatPage.dart';
import 'HomePage.dart';
import 'SellPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

PageController pageController;

class _HomeState extends State<Home> {
  int currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  Widget build(BuildContext context) {
    return Scaffold(
     
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 200), curve: Curves.ease);
        },
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        fixedColor: Colors.blue,
        backgroundColor: purple,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.home),
              // ignore: deprecated_member_use
              title: new Text(
                'Home',
              )),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: FaIcon(FontAwesomeIcons.comment),
              // ignore: deprecated_member_use
              title: new Text(
                'Chat',
              )),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: ColorCircle(),
              // ignore: deprecated_member_use
              title: new Text(
                'Sell',
              )),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: FaIcon(FontAwesomeIcons.image),
              // ignore: deprecated_member_use
              title: new Text(
                'My Ads',
              )),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: FaIcon(FontAwesomeIcons.solidUser),
            // ignore: deprecated_member_use
            title: new Text(
              'Account',
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          HomePage(),
          ChatPage(),
          Hive.box("user").get("phone") == null ? PhoneNumber() : SellPage(),
          MyAdsPage(),
          Account(),
        ],
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
