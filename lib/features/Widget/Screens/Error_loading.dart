import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

import '../../../core/Constant/Constand.dart';

class ErrorLoding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
    Container(
        height: 200,
        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: FlareActor(
          "assets/notfound.flr",
          shouldClip: false,
          alignment: Alignment.center,
          fit: BoxFit.contain,
          animation: "not_found",

          //   controller: _teddyController,
        )),
    Text(
      "Not Found",
      style: head1,
    )
      ],
    );
  }
}
