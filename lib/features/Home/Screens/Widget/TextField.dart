import 'package:flutter/material.dart';

import '../../../../core/Constant/Constand.dart';

class Formfield extends StatelessWidget {
  const Formfield(
      {Key key,
      this.hintText,
      this.validator,
      this.value,
      this.controller,
      this.icon})
      : super(key: key);
  final String hintText;
  final Function validator;
  final IconData icon;
  final bool value;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        obscureText: value,
        style: textfield1,
        controller: controller,
        decoration: new InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
            hintText: hintText,
            hintStyle: textfield1,
            filled: true,
            fillColor: Colors.white,
            border: form,
            prefixIcon: Icon(
              icon,
              color: Colors.black,
              size: 25,
            ),
            enabledBorder: form,
            focusedBorder: form),
        validator: validator,
      ),
    );
  }
}
