// import 'package:flutter/material.dart';
// import 'package:pet_app/Constant/Constand.dart';
// import 'package:pet_app/Screens/Auth/Login.dart';
// import 'package:pet_app/Screens/Auth/Signup.dart';
// import 'package:pet_app/Screens/Widget/Button.dart';
// import 'package:pet_app/Screens/Widget/ImageSlider.dart';

// class IntroScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: background,
//       body: SafeArea(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Imageslider(),
//           Auth(
//             text: "Find the best pet",
//             fontsize: 30,
//           ),
//           Auth(
//             text: "in your location",
//             fontsize: 30,
//           ),
//           Text(
//             'choose a location and we will ',
//             style: sub1,
//           ),
//           Text(
//             'show the all animals in this area',
//             style: sub1,
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           GestureDetector(
//             onTap: () {
//               Navigator.pushReplacement(context,
//                   MaterialPageRoute(builder: (context) {
//                 return Login();
//               }));
//             },
//             child: Button(
//               width: 180,
//               label: "Get Started",
//             ),
//           )
//         ],
//       )),
//     );
//   }
// }
