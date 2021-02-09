import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Location extends Equatable {
  final int id;
  final String state;
  final String district;
  final String place;
  final String latitude;
  final String longitude;

  Location({
    @required this.id,
    @required this.state,
    @required this.district,
    @required this.place,
    @required this.latitude,
    @required this.longitude,
  });
  @override
  List<Object> get props => [
        id,
        state,
        district,
        place,
        latitude,
        longitude,
      ];
}
