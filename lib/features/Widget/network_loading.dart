import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';


class NetworkLoading extends StatelessWidget {
  const NetworkLoading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
                  height: 200,
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: FlareActor(
                    "assets/PetParents.flr",
                    shouldClip: false,
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.contain,
                    animation: "Like",

                    //   controller: _teddyController,
                  ))
    );
  }
}
