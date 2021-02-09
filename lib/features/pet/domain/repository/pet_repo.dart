import 'dart:ffi';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/error.dart';
import '../entity/pet.dart';

abstract class PetRepo {
  ///[getaPet] will fetch all the data from db
  Future<Either<Errors, List<Pet>>> getpet();

  ///[createPet] will create pet data in db
  Future<Either<Errors, Pet>> createPet(Pet pet);

  ///[categoryPet] will fetch categry wise   data from db
  Future<Either<Errors, List<Pet>>> categoryPet(String category);

  ///[getaPet] will fetch all the data from db
  Future<Either<Errors, List<Pet>>> myPet();

  ///[deletePet] will delete  data from db
  Future<Either<Errors,Void>> deletePet(int id);

  ///[updaePet] will update  the data from db
  Future<Either<Errors, Pet>> updaePet(int id, Pet pet);
   ///[searchPet] will update  the data from db
  Future<Either<Errors, List<Pet>>> searchPet(String name);
    ///[singlePet] will update  the data from db
  Future<Either<Errors, Pet>> singlePet(int id);
}
