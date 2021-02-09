import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/Constant/API_Constants.dart';
import '../../../../core/config/api_config.dart';
import '../../../../core/errors/error.dart';
import '../../domain/entity/pet.dart';
import '../model/pet_model.dart';

abstract class PetRemote {
  Future<Either<Errors, Pet>> createPet(Pet pet);
  Future<Either<Errors, List<Pet>>> getallPet(String lat, String long);
  Future<Either<Errors, List<Pet>>> categoryPet(
      String category, String lat, String long);
  Future<Either<Errors, List<Pet>>> myPet();

  Future<Either<Errors, Void>> deletePet(int id);

  Future<Either<Errors, Pet>> updaePet(int id, Pet pet);

  Future<Either<Errors, List<Pet>>> searchPet(
      String name, String lat, String long);

  Future<Either<Errors, Pet>> singlePet(int id);
}

class PetRemoteImpl extends PetRemote {
  final ApiConfig apiConfig;

  PetRemoteImpl({
    @required this.apiConfig,
  });
  @override
  Future<Either<Errors, Pet>> createPet(
    Pet pet,
  ) async {
    return apiConfig.postData<PetModel>(
      endpoint: ApiEndpoints.createPet,
      data: {
        "owner_phone": pet.phone,
        "latitude": pet.longitude,
        "longitude": pet.latitude,
        "owner_name": pet.userName,
        "owner_image": pet.userImage,
        "pet_name": pet.petName,
        "pet_category": pet.petCategory,
        "amount": pet.amount,
        "description": pet.description,
        "age": pet.age,
        "location": pet.location,
        "photo1": await MultipartFile.fromFile(pet.photo1,
            filename: pet.photo1.toString()),
        "photo2": await MultipartFile.fromFile(pet.photo2,
            filename: pet.photo2.toString()),
        "photo3": pet.photo3 == null
            ? null
            : await MultipartFile.fromFile(pet.photo3,
                filename: pet.photo3.toString()),
        "photo4": pet.photo4 == null
            ? null
            : await MultipartFile.fromFile(pet.photo4,
                filename: pet.photo4.toString()),
        "video": pet.video == null
            ? null
            : await MultipartFile.fromFile(pet.video,
                filename: pet.video.toString()),
        "transportation": pet.transportation,
      },
      instance: PetModel(),
    );
  }

  @override
  Future<Either<Errors, List<Pet>>> getallPet(String lat, String long) async {
    return apiConfig.getListData<PetModel>(
      endpoint: ApiEndpoints.locationViewPet(long, lat),
      instance: PetModel(),
    );
  }

  @override
  Future<Either<Errors, List<Pet>>> categoryPet(
      String category, String lat, String long) async {
    return apiConfig.getListData<PetModel>(
      endpoint: ApiEndpoints.categoryPet(category, long, lat),
      instance: PetModel(),
    );
  }

  @override
  Future<Either<Errors, List<Pet>>> myPet() async {
    return apiConfig.getListData<PetModel>(
      endpoint: ApiEndpoints.myPet,
      instance: PetModel(),
    );
  }

  @override
  Future<Either<Errors, Void>> deletePet(int id) async {
    String string;
    return apiConfig.getData(
      endpoint: ApiEndpoints.petDeleteUpdate(id),
      instance: string,
    );
  }

  @override
  Future<Either<Errors, Pet>> updaePet(int id, Pet pet) async {
    return apiConfig.postData<PetModel>(
      endpoint: ApiEndpoints.petDeleteUpdate(id),
      instance: PetModel(),
      data: {
        "pet_name": pet.petName,
        "amount": pet.amount,
        "description": pet.description,
        "age": pet.age,
        "location": pet.location,
        "transportation": pet.transportation,
      },
    );
  }

  @override
  Future<Either<Errors, List<Pet>>> searchPet(
      String name, String lat, String long) async {
    return apiConfig.getListData<PetModel>(
      endpoint: ApiEndpoints.searchPet(name, long, lat),
      instance: PetModel(),
    );
  }

  @override
  Future<Either<Errors, Pet>> singlePet(int id) async {
    return apiConfig.getData<PetModel>(
      endpoint: ApiEndpoints.petDeleteUpdate(id),
      instance: PetModel(),
    );
  }
}
