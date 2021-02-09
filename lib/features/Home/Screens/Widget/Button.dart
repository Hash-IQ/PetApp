import 'package:flutter/material.dart';

import '../../../../core/Constant/Constand.dart';

class Button extends StatelessWidget {
  const Button({Key key, this.width, this.label}) : super(key: key);
  final double width;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
        color: purple,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            label,
            style: button,
          ),
        ),
      ),
    );
  }
}
