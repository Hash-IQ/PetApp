import 'package:dartz/dartz.dart';
import 'package:petapp/core/errors/error.dart';
import 'package:petapp/features/Home/location/domain/entity/location.dart';

abstract class LocationRepo {
  ///[getLocationBasedDistrict] will fetch all the data from db
  Future<Either<Errors, List<Location>>> getLocationBasedDistrict(String district);

  ///[searchLocation] will fetch all the data from db
  Future<Either<Errors, List<Location>>> searchLocation(String name);
}
