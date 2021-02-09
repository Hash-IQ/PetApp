// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocatonModel _$LocatonModelFromJson(Map<String, dynamic> json) {
  return LocatonModel(
    id: json['id'] as int ?? '',
    state: json['state'] as String ?? '',
    district: json['district'] as String ?? '',
    place: json['place'] as String ?? '',
    latitude: json['latitude'] as String ?? '',
    longitude: json['longitude'] as String ?? '',
  );
}

Map<String, dynamic> _$LocatonModelToJson(LocatonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'state': instance.state,
      'district': instance.district,
      'place': instance.place,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
