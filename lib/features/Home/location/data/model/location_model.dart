import 'package:json_annotation/json_annotation.dart';
import 'package:petapp/core/config/json_config.dart';
import 'package:petapp/features/Home/location/domain/entity/location.dart';

part 'location_model.g.dart';

@JsonSerializable(nullable: true)
class LocatonModel extends Location implements JsonModel<LocatonModel> {
  @JsonKey(name: 'id', defaultValue: '')
  final int id;
  @JsonKey(name: 'state', defaultValue: '')
  final String state;
  @JsonKey(name: 'district', defaultValue: '')
  final String district;
  @JsonKey(name: 'place', defaultValue: '')
  final String place;
  @JsonKey(name: 'latitude', defaultValue: '')
  final String latitude;
  @JsonKey(name: 'longitude', defaultValue: '')
  final String longitude;

  LocatonModel({
    this.id,
    this.state,
    this.district,
    this.place,
    this.latitude,
    this.longitude,
  }) : super(
            district: district,
            id: id,
            latitude: latitude,
            longitude: longitude,
            place: place,
            state: state);
  @override
  LocatonModel fromJson(Map<String, dynamic> json) =>
      _$LocatonModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LocatonModelToJson(this);
}
