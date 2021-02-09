import 'package:json_annotation/json_annotation.dart';

import '../../../../core/config/json_config.dart';
import '../../domain/entity/pet.dart';

part 'pet_model.g.dart';

@JsonSerializable(nullable: true)
class PetModel extends Pet implements JsonModel<PetModel> {
  @JsonKey(name: 'id', defaultValue: '')
  final int id;
  @JsonKey(name: 'owner_name', defaultValue: '')
  final String userName;
  @JsonKey(name: 'owner_image', defaultValue: '')
  final String userImage;
  @JsonKey(name: 'pet_name', defaultValue: '')
  final String petName;
  @JsonKey(name: 'pet_category', defaultValue: '')
  final String petCategory;
  @JsonKey(name: 'amount', defaultValue: '')
  final String amount;
  @JsonKey(name: 'description', defaultValue: '')
  final String description;
  @JsonKey(name: 'age', defaultValue: '')
  final String age;
  @JsonKey(name: 'location', defaultValue: '')
  final String location;
  @JsonKey(name: 'saled', defaultValue: '')
  final bool saled;
  @JsonKey(name: 'created_at', defaultValue: '')
  final DateTime createddate;
  @JsonKey(name: 'photo1', defaultValue: '')
  final String photo1;
  @JsonKey(name: 'photo2', defaultValue: '')
  final String photo2;
  @JsonKey(name: 'photo3', defaultValue: '')
  final String photo3;
  @JsonKey(name: 'photo4', defaultValue: '')
  final String photo4;
  @JsonKey(name: 'video', defaultValue: '')
  final String video;
  @JsonKey(name: 'latitude', defaultValue: '')
  final String latitude;
  @JsonKey(name: 'longitude', defaultValue: '')
  final String longitude;
  @JsonKey(name: 'owner_phone', defaultValue: '')
  final String phone;
  @JsonKey(name: 'transportation', defaultValue: '')
  final bool transportation;
  PetModel({
    this.id,
    this.userName,
    this.userImage,
    this.petName,
    this.petCategory,
    this.amount,
    this.description,
    this.age,
    this.location,
    this.saled,
    this.createddate,
    this.photo1,
    this.photo2,
    this.photo3,
    this.photo4,
    this.video,
    this.latitude,
    this.longitude,
    this.phone,
    this.transportation,
  }) : super(
          id: id,
          userName: userName,
          userImage: userImage,
          age: age,
          amount: amount,
          createddate: createddate,
          description: description,
          location: location,
          petCategory: petCategory,
          petName: petName,
          photo1: photo1,
          photo2: photo2,
          photo3: photo3,
          photo4: photo4,
          saled: saled,
          video: video,
          latitude: latitude,
          longitude: longitude,
          phone: phone,
          transportation: transportation,
        );

  @override
  PetModel fromJson(Map<String, dynamic> json) => _$PetModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PetModelToJson(this);
}
