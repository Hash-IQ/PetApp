import 'package:flutter/material.dart';

class ColorCircle extends StatelessWidget {
  const ColorCircle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
          bottomLeft: Radius.circular(50.0),
        ),
        child: Center(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 20,
                  width: 20,
                  color: Colors.red,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 20,
                  width: 20,
                  color: Colors.blue,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 20,
                  width: 20,
                  color: Colors.green,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 20,
                  width: 20,
                  color: Colors.purple,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(
                              50.0) //                 <--- border radius here
                          ),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 15,
                            color: Colors.grey,
                            offset: Offset(1, 2))
                      ]),
                  child: Icon(
                    Icons.add,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
