import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:petapp/core/Constant/API_Constants.dart';
import 'package:petapp/core/config/api_config.dart';
import 'package:petapp/core/errors/error.dart';
import 'package:petapp/features/Home/location/data/model/location_model.dart';
import 'package:petapp/features/Home/location/domain/entity/location.dart';

abstract class LocationRemote {
  Future<Either<Errors, List<Location>>> getLocationBasedDistrict(
      String district);
  Future<Either<Errors, List<Location>>> searchLocation(String name);
}

class LocationRemoteImpl extends LocationRemote {
  final ApiConfig apiConfig;

  LocationRemoteImpl({
    @required this.apiConfig,
  });
  @override
  Future<Either<Errors, List<Location>>> getLocationBasedDistrict(
      String district) async {
    return apiConfig.getListData<LocatonModel>(
      endpoint: ApiEndpoints.getLocationDistrict(district),
      instance: LocatonModel(),
    );
  }

  @override
  Future<Either<Errors, List<Location>>> searchLocation(String name) async {
    return apiConfig.getListData<LocatonModel>(
      endpoint: ApiEndpoints.searchLocation(name),
      instance: LocatonModel(),
    );
  }
}
