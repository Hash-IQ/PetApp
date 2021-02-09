import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:petapp/features/Home/location/data/remote/location_remote.dart';
import 'package:petapp/features/Home/location/data/repository/location_repo_impl.dart';
import 'package:petapp/features/Home/location/domain/repository/location_repo.dart';

import 'core/config/api_config.dart';
import 'features/auth/data/repo/auth_repo_impl.dart';
import 'features/auth/domain/repositories/auth_repo.dart';
import 'features/pet/data/datasource/pet_remote.dart';
import 'features/pet/data/repository/pet_repo_impl.dart';
import 'features/pet/domain/repository/pet_repo.dart';

final sl = GetIt.instance;
Future<void> init() async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  sl.registerLazySingleton<HiveInterface>(() => Hive);
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton(() => Logger());
  sl.registerLazySingleton(() => GoogleSignIn());
  sl.registerLazySingleton(() => _auth);
  sl.registerLazySingleton(
    () => ApiConfig(
      client: sl(),
      auth: sl<FirebaseAuth>(),
      logger: sl<Logger>(),
    ),
  );
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      firebaseAuth: sl(),
      googleSignIn: sl(),
      logger: sl(),
    ),
  );
  sl.registerLazySingleton<PetRemote>(
    () => PetRemoteImpl(
      apiConfig: sl(),
    ),
  );
  sl.registerLazySingleton<PetRepo>(
    () => PetRepoImpl(
      petRemote: sl(),
    ),
  );
  sl.registerLazySingleton<LocationRepo>(
    () => LocationRepoImpl(remote: sl()),
  );
  sl.registerLazySingleton<LocationRemote>(
    () => LocationRemoteImpl(apiConfig: sl()),
  );
}
