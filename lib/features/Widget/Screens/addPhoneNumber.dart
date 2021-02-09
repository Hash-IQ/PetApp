import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../Home/Screens/Home/SellPage.dart';
import '../../Home/Screens/Widget/Button.dart';



class PhoneNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: "Enter Phone Number",
               
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Phone Number';
                    }
                    return null;
                  },
                ),
              ),
            ),
             Padding(
               padding: const EdgeInsets.all(20.0),
               child: GestureDetector(
        onTap: () {
          if (_formKey.currentState.validate()) {
            // If the form is valid, display a Snackbar.
            Hive.box("user").put("phone", controller.text).then((value) =>
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SellPage())));
          }
        },
        child:Button(
          label: "Update",
          width: MediaQuery.of(context).size.width,
        ),
      ),
             ),
              Text("Update phone number to post ad"),
          ],
        ),
      ),
    );
  }
}
