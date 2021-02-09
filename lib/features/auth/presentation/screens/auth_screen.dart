import 'package:flutter/material.dart';

import '../../../../core/Constant/Constand.dart';
import '../../../Widget/outline_button.dart';
import '../../../Widget/termsandcondiitons.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Image.asset(
              "assets/images/logos.png",
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              "Welcome To Petlo",
              style: titl,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool value) {
                    setState(() {
                      isChecked = value;
                      if (value == true) {
                        setState(() {
                          isChecked = true;
                        });
                      }
                      if (value == false) {
                        isChecked = false;
                      }
                    });
                  },
                ),
                GestureDetector(
                  onTap: () {
                
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TermsAndCondition()));
                  },
                  child: Text(
                    "Accept Terms & conditions",
                    style: terms,
                  ),
                )
              ],
            ),
            Center(
              child: OutLinedButton(
                title: "Sign in with Google",
                imageUrl: "assets/images/googleIcon.png",
                width: deviceSize.width * 0.234,
                isChecked: isChecked,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
