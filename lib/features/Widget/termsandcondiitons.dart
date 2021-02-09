import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petapp/core/Constant/Constand.dart';

class TermsAndCondition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Terms & Conditions",
                style: termshead,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              "# Company is in no way responsible for anything that \n happens after using this application",
              style: sub,
            ),
            Text(
              "# Trying to sell or buy animals illegally is criminal \n offence.Legal action will be taken if such incidents \n occur or are noticed.",
              style: sub,
            ),
            Text(
              "# The company does not force anyone to buy animals.",
              style: sub,
            ),
            Text(
              "# Each of you must buy your own pet at your own risk",
              style: sub,
            ),
          ],
        ),
      )),
    );
  }
}
