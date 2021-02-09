import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:petapp/core/errors/error.dart';
import 'package:petapp/features/Home/location/data/remote/location_remote.dart';
import 'package:petapp/features/Home/location/domain/entity/location.dart';
import 'package:petapp/features/Home/location/domain/repository/location_repo.dart';

class LocationRepoImpl extends LocationRepo {
  final LocationRemote remote;

  LocationRepoImpl({
    @required this.remote,
  });
  @override
  Future<Either<Errors, List<Location>>> getLocationBasedDistrict(
      String district) async {
    List<Location> location;
    Errors errors;

    var res = await remote.getLocationBasedDistrict(district);
    res.fold(
      (l) => errors = l,
      (r) => location = r,
    );
    if (errors != null) return Left(errors);

    return Right(location);
  }

  @override
  Future<Either<Errors, List<Location>>> searchLocation(String name) async {
    List<Location> location;
    Errors errors;

    var res = await remote.searchLocation(name);
    res.fold(
      (l) => errors = l,
      (r) => location = r,
    );
    if (errors != null) return Left(errors);

    return Right(location);
  }
}
