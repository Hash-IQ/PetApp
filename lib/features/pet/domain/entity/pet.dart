import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Pet extends Equatable {
  final int id;
  final String userName;
  final String userImage;
  final String petName;
  final String petCategory;
  final String amount;
  final String description;
  final String age;
  final String location;
  final bool saled;
  final DateTime createddate;
  final String photo1;
  final String photo2;
  final String photo3;
  final String photo4;
  final String video;
  final String latitude;
  final String longitude;
  final String phone;
  final bool transportation;

  Pet({
    @required this.id,
    @required this.userName,
    @required this.userImage,
    @required this.petName,
    @required this.petCategory,
    @required this.amount,
    @required this.description,
    @required this.age,
    @required this.location,
    @required this.saled,
    @required this.createddate,
    @required this.photo1,
    @required this.photo2,
    @required this.photo3,
    @required this.photo4,
    @required this.video,
    @required this.latitude,
    @required this.longitude,
    @required this.phone,
    @required this.transportation,
  });
  @override
  List<Object> get props => [
        id,
        userName,
        userImage,
        petName,
        age,
        amount,
        createddate,
        description,
        location,
        petCategory,
        photo1,
        photo2,
        photo3,
        photo4,
        video,
        latitude,
        longitude,
        phone,
        transportation,
      ];
}
