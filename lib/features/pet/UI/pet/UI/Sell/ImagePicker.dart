import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoder/model.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/Constant/Constand.dart';
import '../../../../../../core/location/get_location.dart';
import '../../../../../Home/Screens/Home/Home.dart';
import '../../../../../Home/Screens/Widget/Button.dart';
import '../../../../domain/entity/pet.dart';
import '../../bloc/pet_bloc.dart';

class SingleImageUpload extends StatefulWidget {
  final String name;
  final String age;
  final String location;
  final String description;
  final String amount;
  final String category;
  final bool transportation;

  const SingleImageUpload({
    Key key,
    this.name,
    this.age,
    this.location,
    this.description,
    this.amount,
    this.category,
    this.transportation,
  }) : super(key: key);
  @override
  _SingleImageUploadState createState() {
    return _SingleImageUploadState();
  }
}

class _SingleImageUploadState extends State<SingleImageUpload> {
//  List<Object> images = List<Object>();
  File imageFile1;
  File imageFile2;
  File imageFile3;
  File imageFile4;

  String image1;
  String image2;
  String image3;
  String image4;
  Coordinates coordinates;
  String name;
  String image;
  String phone;
  ImagePicker picker = ImagePicker();
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  pickImageFromGallery1() async {
    PickedFile pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 60);

    File image = File(pickedFile.path);

    setState(() {
      imageFile1 = image;
      List<int> imageBytes = image.readAsBytesSync();
      image1 = base64Encode(imageBytes);
    });
  }

  pickImageFromGallery2() async {
    PickedFile pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 60);

    File image = File(pickedFile.path);

    setState(() {
      imageFile2 = image;
      List<int> imageBytes = image.readAsBytesSync();
      image2 = base64Encode(imageBytes);
    });
  }

  pickImageFromGallery3() async {
    PickedFile pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 60);

    File image = File(pickedFile.path);

    setState(() {
      imageFile3 = image;
      List<int> imageBytes = image.readAsBytesSync();
      image3 = base64Encode(imageBytes);
    });
  }

  pickImageFromGallery4() async {
    PickedFile pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 60);

    File image = File(pickedFile.path);

    setState(() {
      imageFile4 = image;
      List<int> imageBytes = image.readAsBytesSync();
      image4 = base64Encode(imageBytes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: const Text(
          'Select Images',
          style: Constants.location,
        ),
        backgroundColor: purple,
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              imageFile1 != null
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: Image.file(
                                imageFile1,
                              ),
                            ),
                            Positioned(
                              right: 5,
                              top: 5,
                              child: InkWell(
                                child: Icon(
                                  Icons.remove_circle,
                                  size: 20,
                                  color: Colors.red,
                                ),
                                onTap: () {
                                  setState(() {
                                    imageFile1 = null;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Card(
                        child: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            pickImageFromGallery1();
                          },
                        ),
                      ),
                    ),
              imageFile2 != null
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: Image.file(
                                imageFile2,
                              ),
                            ),
                            Positioned(
                              right: 5,
                              top: 5,
                              child: InkWell(
                                child: Icon(
                                  Icons.remove_circle,
                                  size: 20,
                                  color: Colors.red,
                                ),
                                onTap: () {
                                  setState(() {
                                    imageFile2 = null;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Card(
                        child: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            pickImageFromGallery2();
                          },
                        ),
                      ),
                    ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              imageFile3 != null
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: Image.file(
                                imageFile3,
                              ),
                            ),
                            Positioned(
                              right: 5,
                              top: 5,
                              child: InkWell(
                                child: Icon(
                                  Icons.remove_circle,
                                  size: 20,
                                  color: Colors.red,
                                ),
                                onTap: () {
                                  setState(() {
                                    imageFile3 = null;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Card(
                        child: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            pickImageFromGallery3();
                          },
                        ),
                      ),
                    ),
              imageFile4 != null
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: <Widget>[
                            Center(
                              child: Image.file(
                                imageFile4,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              right: 5,
                              top: 5,
                              child: InkWell(
                                child: Icon(
                                  Icons.remove_circle,
                                  size: 20,
                                  color: Colors.red,
                                ),
                                onTap: () {
                                  setState(() {
                                    imageFile4 = null;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Card(
                        child: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            pickImageFromGallery4();
                          },
                        ),
                      ),
                    ),
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Center(child: Text("Select minum two Photos",style: Constants.waring,),),
          // )
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () async {
        //  coordinates = await getUserCoordinates();
          name = await Hive.box('user').get('name');
          image = await Hive.box('user').get('dp');
          phone = await Hive.box('user').get('phone');
          print(coordinates);
          print("#################");

          if (imageFile1 == null && imageFile2 == null) {
            showToast(
              "Select minimum two Photos",
            );
          } else {
            if (widget.category == "Accessories") {
              Pet pet = Pet(
                userName: name,
                userImage: image,
                petName: widget.name,
                petCategory: widget.category,
                amount: widget.amount,
                description: widget.description,
                age: widget.age,
                location: widget.location,
                photo1: imageFile1.path == null ? null : imageFile1.path,
                photo2: imageFile2.path == null ? null : imageFile2.path,
                photo3: imageFile3.path == null ? null : imageFile3.path,
                photo4: imageFile4.path == null ? null : imageFile4.path,
                video: null,
                createddate: null,
                saled: null,
                latitude: coordinates.latitude.toString(),
                longitude: coordinates.longitude.toString(),
                phone: phone,
                id: null,
                transportation: widget.transportation,
              );
              BlocProvider.of<PetBloc>(context).add(PetEventStarted(pet: pet));
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Success"),
                      content: Text("Post was uploaded successfully"),
                      actions: [
                        FlatButton(
                          child: Text(
                            "OK",
                            style:
                                TextStyle(color: Constants.themeGradients[0]),
                          ),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                                (route) => false);
                          },
                        )
                      ],
                    );
                  });
            } else {
              Pet pet = Pet(
                userName: name,
                userImage: image,
                petName: widget.name,
                petCategory: widget.category,
                amount: widget.amount,
                description: widget.description,
                age: widget.age,
                location: widget.location,
                photo1: imageFile1.path == null ? null : imageFile1.path,
                photo2: imageFile2.path == null ? null : imageFile2.path,
                photo3: imageFile3.path == null ? null : imageFile3.path,
                photo4: imageFile4.path == null ? null : imageFile4.path,
                video: null,
                createddate: null,
                saled: null,
                latitude: coordinates.latitude.toString(),
                longitude: coordinates.longitude.toString(),
                phone: phone,
                id: null,
                transportation: widget.transportation,
              );
              BlocProvider.of<PetBloc>(context).add(PetEventStarted(pet: pet));
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Success"),
                      content: Text("Post was uploaded successfully"),
                      actions: [
                        FlatButton(
                          child: Text(
                            "OK",
                            style:
                                TextStyle(color: Constants.themeGradients[0]),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          },
                        )
                      ],
                    );
                  });
            }
          }
        },
        child: Button(
          label: "Next",
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
