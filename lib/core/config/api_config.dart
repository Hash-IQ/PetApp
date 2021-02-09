import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

import '../../features/pet/domain/entity/pet.dart';
import '../errors/error.dart';
import 'json_config.dart';

class ApiConfig {
  final Dio client;
  final Logger _log;
  final FirebaseAuth auth;

  ApiConfig({
    @required this.client,
    @required this.auth,
    @required Logger logger,
  }) : _log = logger;
  User get _user => auth.currentUser;

  /// [GetData] will be called with a data-type of [T] which
  /// inherites the properties of [JsonModel] so that it will
  /// have `.fromJson` method attached to it and will return
  /// one instance of the obj [T]
  ///
  /// `Note` : Only call this if the response will return a [Map]
  Future<Either<Errors, T>> getData<T extends JsonModel>({
    @required String endpoint,
    @required T instance,
  }) async {
    Response response;
    // if (!await networkConfig.isConnected) return Left(Errors.networkError());
    try {
      String token = await _user.getIdToken();
      print(
          "#################################################################");
      _log.i(token);
      _log.i(_user.uid);
      print(
          "#################################################################");
      if (token != null) client.options.headers['Authorization'] = token;
      response = await client.get(endpoint);
      // _log.i(response.data);
      var res = instance.fromJson(jsonDecode(response.data)) as T;
      return Right(res);
    } on DioError catch (dioerror) {
      var err = Errors.fromResponse(dioerror.response, dioerror.toString());
      // _log.e(err);
      return Left(err);
    } catch (e) {
      var err = Errors.unknownError(
        "Oops something went wrong",
        stackTrace: e.toString(),
      );
      // _log.e(err);
      return Left(err);
    }
  }

  /// [GetListData] should be called with a data-type of [T] which
  /// inherites the properties of [JsonModel] so that it will
  /// have `.fromJson` method attached to it and will return
  /// one instance of the obj [T]
  ///
  /// `Note` : Only call this if the response will return a [List]
  Future<Either<Errors, List<T>>> getListData<T extends JsonModel>({
    @required String endpoint,
    @required T instance,
  }) async {
    //if (!await networkConfig.isConnected) return Left(Errors.networkError());

    try {
      _log.d("started");

      String token = await _user.getIdToken();
      print(
          "#################################################################");
      // _log.i(token);
      //_log.i(_user.uid);
      print(
          "#################################################################");
      if (token != null) client.options.headers['Authorization'] = token;
      Response response = await client.get(endpoint);
      //_log.d(response.data);
      var data = (response.data) as List;
      //  _log.d(data);

      //  _log.d(data);
      var res = data.map<T>((e) => instance.fromJson(e)).toList();
      //  _log.d(res);
      return Right(res);
    } on DioError catch (dioerror) {
      var err = Errors.fromResponse(dioerror.response, dioerror.toString());
      _log.e(err);
      return Left(err);
    } catch (e) {
      var err = Errors.unknownError(
        "Oops something went wrong",
        stackTrace: e.toString(),
      );
      // _log.e(err);
      return Left(err);
    }
  }

  /// [PostData] should be called with a data-type of [T] which
  /// inherites the properties of [JsonModel] so that it will
  /// have `.fromJson` method attached to it and will return
  /// one instance of the obj [T]
  ///
  /// `Note` : Only call this if the response will return a [Map]
  Future<Either<Errors, T>> postData<T extends JsonModel>({
    @required String endpoint,
    @required Map<String, dynamic> data,
    @required T instance,
  }) async {
    try {
      String token = await _user.getIdToken();
      print(
          "#################################################################");
      // _log.i(token);
      // _log.i(_user.uid);
      print(
          "#################################################################");
      client.options.headers["Authorization"] = token;
      Response response = await client.post(
        endpoint,
        data: FormData.fromMap(data),
        options: Options(contentType: 'application/json'),
      );
      // _log.i(response.data);
      var res = instance.fromJson((response.data)) as T;
      return Right(res);
    } on DioError catch (dioerror) {
      var err = Errors.fromResponse(dioerror.response, dioerror.toString());
      _log.e(err);
      return Left(err);
    } catch (e) {
      var err = Errors.unknownError(
        "Oops something went wrong",
        stackTrace: e.toString(),
      );
      // _log.e(err);
      return Left(err);
    }
  }

  /// [postListData] should be called with a data-type of [T] which
  /// inherites the properties of [JsonModel] so that it will
  /// have `.fromJson` method attached to it and will return
  /// one instance of the obj [T]
  ///
  /// `Note` : Only call this if the response will return a [Map]
  Future<Either<Errors, List<T>>> postListData<T extends JsonModel>({
    @required String endpoint,
    @required Map<String, dynamic> datas,
    @required T instance,
  }) async {
    // if (!await networkConfig.isConnected) return Left(Errors.networkError());

    try {
      _log.d("started");

      String token = await _user.getIdToken();
      print(
          "#################################################################");
      _log.i(token);
      _log.i(_user.uid);
      print(
          "#################################################################");
      client.options.headers["Authorization"] = token;
      Response response =
          await client.post(endpoint, data: FormData.fromMap(datas));
      // _log.d(response);
      var data = (response.data) as List;
      //  _log.d(data);
      var res = data.map<T>((e) => instance.fromJson(e)).toList();
      _log.d(res);
      return Right(res);
    } on DioError catch (dioerror) {
      var err = Errors.fromResponse(dioerror.response, dioerror.toString());
      //  _log.e(err);
      return Left(err);
    } catch (e) {
      var err = Errors.unknownError(
        "Oops something went wrong",
        stackTrace: e.toString(),
      );
      // _log.e(err);
      return Left(err);
    }
  }

  Future<String> deletePost({@required String endpoint}) async {
    _log.d("started");

    String token = await _user.getIdToken();
    print("#################################################################");
    _log.i(token);
    _log.i(_user.uid);
    print("#################################################################");
    client.options.headers["Authorization"] = token;
    Response response = await client.get(
      endpoint,
    );
    _log.d(response.data);
    return response.data;
  }

  Future<bool> updatePost({
    @required String endpoint,
    @required Pet pet,
  }) async {
    _log.d("started");

    String token = await _user.getIdToken();
    print("#################################################################");
    _log.i(token);
    _log.i(_user.uid);
    print("#################################################################");
    client.options.headers["Authorization"] = token;
    Response response = await client.post(
      endpoint,
      data: FormData.fromMap(
        {
          "pet_name": pet.petName,
          "amount": pet.amount,
          "description": pet.description,
          "age": pet.age,
          "location": pet.location,
          "transportation": pet.transportation,
        },
      ),
      options: Options(contentType: 'application/json'),
    );
    _log.d(response.data);
     _log.d(response.statusCode);
    return true;
  }
}
