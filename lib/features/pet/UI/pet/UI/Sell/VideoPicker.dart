// import 'dart:io';

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geocoder/geocoder.dart';
// import 'package:hive/hive.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:video_player/video_player.dart';

// import '../../../../../../core/Constant/Constand.dart';
// import '../../../../../../core/location/get_location.dart';
// import '../../../../../Home/Screens/Home/Home.dart';
// import '../../../../../Home/Screens/Widget/Button.dart';
// import '../../../../domain/entity/pet.dart';
// import '../../bloc/pet_bloc.dart';

// class VideoPicker extends StatefulWidget {
//   final String name;
//   final String age;
//   final String location;
//   final String description;
//   final String amount;
//   final File image1;
//   final File image2;
//   final File image3;
//   final File image4;
//   final String category;

//   const VideoPicker(
//       {Key key,
//       this.name,
//       this.age,
//       this.location,
//       this.description,
//       this.amount,
//       this.image1,
//       this.image2,
//       this.image3,
//       this.image4,
//       this.category})
//       : super(key: key);
//   @override
//   _VideoPickerState createState() => _VideoPickerState();
// }

// class _VideoPickerState extends State<VideoPicker> {
//   File videoFile;
//   VideoPlayerController _videoPlayerController;
//   File videoThumbNail;
//   Coordinates coordinates;
//   String name;
//   String image;
//   String phone;
//   //CreatePet createPet = CreatePet();
//   Future onVideoButtonPressed(ImageSource source,
//       {BuildContext context, int quality}) async {
//     FilePickerResult result = await FilePicker.platform.pickFiles(
//       type: FileType.video,
//     );

//     if (result != null) {
//       File file = File(result.files.single.path);
//       print("File path---------------${file.path}");
//       print("File size------------------------${file.lengthSync()}");
//       int sizeInBytes = file.lengthSync();
//       if (sizeInBytes > Constants.MAX_SIZE_IN_BYTES) {
//         showToast(Constants.FILE_SIZE_NOT_VALID);
//         Navigator.pop(context);
//       }

//       videoFile = file;

//       _videoPlayerController = VideoPlayerController.file(
//         videoFile,
//       )..initialize().then((_) {
//           setState(() {});
//           //  _videoPlayerController.play();

//           _videoPlayerController.setLooping(true);
//         });
//     } else {
//       // User canceled the picker
//     }
//   }

//   @override
//   void initState() {
//     getcordinate();
//     super.initState();
//   }

//   void getcordinate() async {}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(
//         centerTitle: true,
//         title: const Text(
//           'Select Video',
//           style: Constants.location,
//         ),
//         backgroundColor: purple,
//       ),
//       body: SafeArea(
//           child: Column(
//         children: [
//           videoFile == null
//               ? Card(
//                   child: Container(
//                     height: MediaQuery.of(context).size.height * 0.5,
//                     width: MediaQuery.of(context).size.width * 1,
//                     child: IconButton(
//                       icon: Icon(Icons.add),
//                       onPressed: () {
//                         onVideoButtonPressed(ImageSource.gallery);
//                       },
//                     ),
//                   ),
//                 )
//               : Card(
//                   clipBehavior: Clip.antiAlias,
//                   child: Container(
//                     height: MediaQuery.of(context).size.height * 0.5,
//                     width: MediaQuery.of(context).size.width * 1,
//                     child: Stack(
//                       children: <Widget>[
//                         Stack(
//                           children: [
//                             Center(child: VideoPlayer(_videoPlayerController)),
//                             Center(
//                               child: GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     if (_videoPlayerController
//                                         .value.isPlaying) {
//                                       _videoPlayerController.pause();
//                                     } else {
//                                       // If the video is paused, play it.
//                                       _videoPlayerController.play();
//                                     }
//                                   });
//                                 },
//                                 child: Icon(
//                                   _videoPlayerController.value.isPlaying
//                                       ? Icons.pause
//                                       : Icons.play_arrow,
//                                   size: 50,
//                                   color: Colors.grey[50],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Positioned(
//                           right: 5,
//                           top: 5,
//                           child: InkWell(
//                             child: Icon(
//                               Icons.remove_circle,
//                               size: 20,
//                               color: Colors.red,
//                             ),
//                             onTap: () {
//                               setState(() {
//                                 videoFile = null;
//                               });
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//           // Padding(
//           //   padding: const EdgeInsets.all(8.0),
//           //   child: Text("Video Size should be less than 15 MB",style: Constants.waring,),
//           // )
//         ],
//       )),
//       bottomNavigationBar: GestureDetector(
//         onTap: () async {
//           if (videoFile != null) {
//             coordinates = await getUserCoordinates();
//             name = await Hive.box('user').get('name');
//             image = await Hive.box('user').get('dp');
//             phone = await Hive.box('user').get('phone');
//             print(coordinates);
//             print("#################");

//             Pet pet = Pet(
//               userName: name,
//               userImage: image,
//               petName: widget.name,
//               petCategory: widget.category,
//               amount: widget.amount,
//               description: widget.description,
//               age: widget.age,
//               location: widget.location,
//               photo1: widget.image1.path,
//               photo2: widget.image2.path,
//               photo3: widget.image3 == null ? null : widget.image3.path,
//               photo4: widget.image4 == null ? null : widget.image4.path,
//               video: videoFile.path,
//               createddate: null,
//               saled: null,
//               latitude: coordinates.latitude.toString(),
//               longitude: coordinates.longitude.toString(),
//               phone: phone,
//               id: null,
//             );

//             BlocProvider.of<PetBloc>(context).add(PetEventStarted(pet: pet));
//             showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     title: Text("Success"),
//                     content: Text("Post was uploaded successfully"),
//                     actions: [
//                       FlatButton(
//                         child: Text(
//                           "OK",
//                           style: TextStyle(color: Constants.themeGradients[0]),
//                         ),
//                         onPressed: () {
//                           Navigator.pushReplacement(context,
//                               MaterialPageRoute(builder: (context) => Home()));
//                         },
//                       )
//                     ],
//                   );
//                 });
//           } else {
//             showToast("Select video");
//           }
//         },
//         child: Button(
//           label: "Next",
//           width: MediaQuery.of(context).size.width,
//         ),
//       ),
//     );
//   }
// }
