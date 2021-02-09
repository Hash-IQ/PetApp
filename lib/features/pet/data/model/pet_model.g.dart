// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PetModel _$PetModelFromJson(Map<String, dynamic> json) {
  return PetModel(
    id: json['id'] as int ?? '',
    userName: json['owner_name'] as String ?? '',
    userImage: json['owner_image'] as String ?? '',
    petName: json['pet_name'] as String ?? '',
    petCategory: json['pet_category'] as String ?? '',
    amount: json['amount'] as String ?? '',
    description: json['description'] as String ?? '',
    age: json['age'] as String ?? '',
    location: json['location'] as String ?? '',
    saled: json['saled'] as bool ?? '',
    createddate: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String) ?? '',
    photo1: json['photo1'] as String ?? '',
    photo2: json['photo2'] as String ?? '',
    photo3: json['photo3'] as String ?? '',
    photo4: json['photo4'] as String ?? '',
    video: json['video'] as String ?? '',
    latitude: json['latitude'] as String ?? '',
    longitude: json['longitude'] as String ?? '',
    phone: json['owner_phone'] as String ?? '',
    transportation: json['transportation'] as bool ?? '',
  );
}

Map<String, dynamic> _$PetModelToJson(PetModel instance) => <String, dynamic>{
      'id': instance.id,
      'owner_name': instance.userName,
      'owner_image': instance.userImage,
      'pet_name': instance.petName,
      'pet_category': instance.petCategory,
      'amount': instance.amount,
      'description': instance.description,
      'age': instance.age,
      'location': instance.location,
      'saled': instance.saled,
      'created_at': instance.createddate?.toIso8601String(),
      'photo1': instance.photo1,
      'photo2': instance.photo2,
      'photo3': instance.photo3,
      'photo4': instance.photo4,
      'video': instance.video,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'owner_phone': instance.phone,
      'transportation': instance.transportation,
    };
