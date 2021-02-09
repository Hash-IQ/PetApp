// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   File _imageFile;
//   Future getVideo() async {
//     File image;
//     image = await ImagePicker.pickVideo(source: ImageSource.gallery);
//     setState(() {
//       _imageFile = image;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Image Upload"),
//       ),
//       body: Card(
//         child: Container(
//           height: MediaQuery.of(context).size.height * 0.5,
//           width: MediaQuery.of(context).size.width * 1,
//           child: IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               getVideo();
//             },
//           ),
//         ),
//       ),
//       bottomNavigationBar: ,
//     );
//   }
// }
