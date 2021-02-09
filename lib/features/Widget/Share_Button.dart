import 'dart:io';
import 'dart:typed_data';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core/Constant/Constand.dart';

// class ShareButton extends StatefulWidget {
//   final String image;
//   final String name;
//   final String amount;
//   final String username;
//   const ShareButton({
//     Key key,
//     this.image,
//     this.name,
//     this.amount,
//     this.username,
//   }) : super(key: key);

//   @override
//   _ShareButtonState createState() => _ShareButtonState();
// }

// class _ShareButtonState extends State<ShareButton>
//     with SingleTickerProviderStateMixin {
//   AnimationController _animationController;
//   @override
//   void initState() {
//     _animationController =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 500));
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   void _runAnimation() async {
//     for (int i = 0; i < 1001; i++) {
//       await _animationController.forward();
//       await _animationController.reverse();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     _runAnimation();
//     AnimationController _animationController;
//     return RotationTransition(
//       turns: Tween(begin: 0.0, end: -.1)
//           .chain(CurveTween(curve: Curves.elasticIn))
//           .animate(_animationController),
//       child: IconButton(
//         icon: Icon(Icons.share),
//         onPressed: () async {
//           showToastLong("Please wait...");
//           var request = await HttpClient().getUrl(Uri.parse(widget.image));
//           var response = await request.close();
//           Uint8List bytes = await consolidateHttpClientResponseBytes(response);
//           await Share.file('PetAPP', 'post.jpg', bytes, 'image/jpg',
//               text:
//                   "${widget.name} \n ₹ ${widget.amount} \n Check out Post from ${widget.username} in Pet App");
//           // "Check this post from ${widget.username} from CampGain
//         },
//       ),
//     );
//   }
// }

class ShareButton extends StatefulWidget {
  final String image;
  final String name;
  final String amount;
  final String username;
  const ShareButton({
    Key key,
    this.image,
    this.name,
    this.amount,
    this.username,
  }) : super(key: key);

  @override
  _ShareButtonState createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  int shares;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }

  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _runAnimation() async {
    for (int i = 0; i < 1001; i++) {
      await _animationController.forward();
      await _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    _runAnimation();
    return RotationTransition(
      turns: Tween(begin: 0.0, end: -.1)
          .chain(CurveTween(curve: Curves.elasticIn))
          .animate(_animationController),
      child: IconButton(
        icon: new Icon(
          Icons.share,
          color: Colors.blue,
        ),
        onPressed: () async {
          showToastLong("Please wait...");
          var request = await HttpClient().getUrl(Uri.parse(widget.image));
          var response = await request.close();
          Uint8List bytes = await consolidateHttpClientResponseBytes(response);
          await Share.file('PetAPP', 'post.jpg', bytes, 'image/jpg',
              text:
                  "${widget.name} \n ₹ ${widget.amount} \n Check out Post from ${widget.username} in Pet App");
          // "Check this post from ${widget.username} from CampGain
        },
      ),
    );
  }
}
