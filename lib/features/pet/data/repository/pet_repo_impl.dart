import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../../../../core/errors/error.dart';
import '../../domain/entity/pet.dart';
import '../../domain/repository/pet_repo.dart';
import '../datasource/pet_remote.dart';

class PetRepoImpl extends PetRepo {
  final PetRemote petRemote;

  PetRepoImpl({
    @required this.petRemote,
  });
  @override
  Future<Either<Errors, List<Pet>>> categoryPet(String category) async {
    Errors err;
    List<Pet> petModel;
    Hive.box('location').get("latitude");
    Hive.box('location').get("longitude");
  
    var res = await petRemote.categoryPet(
      category,
      Hive.box('location').get("latitude").toString(),
      Hive.box('location').get("longitude").toString(),
    );
    res.fold(
      (l) => err = l,
      (r) => petModel = r,
    );
    if (err != null) return Left(err);

    return Right(petModel);
  }

  @override
  Future<Either<Errors, List<Pet>>> getpet() async {
    Errors err;
    List<Pet> petModel;

    var res = await petRemote.getallPet(
      Hive.box('location').get("latitude").toString(),
      Hive.box('location').get("longitude").toString(),
    );
    res.fold(
      (l) => err = l,
      (r) => petModel = r,
    );
    if (err != null) return Left(err);

    return Right(petModel);
  }

  @override
  Future<Either<Errors, Pet>> createPet(Pet pet) async {
    Errors err;
    Pet petModel;
    var res = await petRemote.createPet(pet);
    res.fold(
      (l) => err = l,
      (r) => petModel = r,
    );
    if (err != null) return Left(err);

    return Right(petModel);
  }

  @override
  Future<Either<Errors, List<Pet>>> myPet() async {
    Errors err;
    List<Pet> petModel;
    var res = await petRemote.myPet();
    res.fold(
      (l) => err = l,
      (r) => petModel = r,
    );
    if (err != null) return Left(err);

    return Right(petModel);
  }

  @override
  Future<Either<Errors, Void>> deletePet(int id) async {
    Errors err;

    // var res = await petRemote.deletePet(id);

    if (err != null) return Left(err);

    return Right(null);
  }

  @override
  Future<Either<Errors, Pet>> updaePet(int id, Pet pet) async {
    Errors err;
    Pet petModel;
    var res = await petRemote.updaePet(id, pet);
    res.fold(
      (l) => err = l,
      (r) => petModel = r,
    );
    if (err != null) return Left(err);

    return Right(petModel);
  }

  @override
  Future<Either<Errors, List<Pet>>> searchPet(String name) async {
    Errors err;
    List<Pet> petModel;

    var res = await petRemote.searchPet(
      name,
      Hive.box('location').get("latitude").toString(),
      Hive.box('location').get("longitude").toString(),
    );
    res.fold(
      (l) => err = l,
      (r) => petModel = r,
    );
    if (err != null) return Left(err);

    return Right(petModel);
  }

  @override
  Future<Either<Errors, Pet>> singlePet(int id) async {
    Errors err;
    Pet petModel;
    var res = await petRemote.singlePet(id);
    res.fold(
      (l) => err = l,
      (r) => petModel = r,
    );
    if (err != null) return Left(err);

    return Right(petModel);
  }
}
