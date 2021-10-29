import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_sample/screens/photo/data/photos_api.dart';
import 'package:flutter_sample/screens/photo/data/photos_repository.dart';
import 'package:flutter_sample/screens/photo/domain/photos_interactor.dart';
import 'package:flutter_sample/screens/photo/domain/photos_interactor_impl.dart';
import 'package:flutter_sample/screens/photo/presentation/photo_cubit.dart';
import 'package:get_it/get_it.dart';

import 'screens/photo/data/photos_repository_impl.dart';

final sl = GetIt.instance;

setup()  {

  sl.registerFactory(() =>
      PhotoCubit(
        photosInteractor: sl(),
      ),
  );

  sl.registerLazySingleton<PhotosInteractor>(() =>
      PhotosInteractorImpl(photosRepository: sl()));
  sl.registerLazySingleton<PhotosRepository>(() =>
      PhotosRepositoryImpl(photosApi: sl<PhotosApi>()));
  sl.registerLazySingleton<Dio>(() =>
      Dio());
  sl.registerLazySingleton<PhotosApi>(() =>
      PhotosApi(sl<Dio>()));
  sl.registerLazySingleton<Random>(() =>
      Random());
  
}