import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_sample/screens/chart/data/companies_api.dart';
import 'package:flutter_sample/screens/chart/data/companies_repository.dart';
import 'package:flutter_sample/screens/chart/domain/companies_interactor.dart';
import 'package:flutter_sample/screens/chart/domain/companies_interactor_impl.dart';
import 'package:flutter_sample/screens/chart/presentation/chart_cubit.dart';
import 'package:get_it/get_it.dart';

import 'screens/chart/data/companies_repository_impl.dart';

final sl = GetIt.instance;

setup()  {

  sl.registerFactory(() =>
      ChartCubit(
        companiesInteractor: sl(),
      ),
  );

  sl.registerLazySingleton<CompaniesInteractor>(() =>
      CompaniesInteractorImpl(companiesRepository: sl()));
  sl.registerLazySingleton<CompaniesRepository>(() =>
      CompaniesRepositoryImpl(companiesApi: sl<CompaniesApi>()));
  sl.registerLazySingleton<Dio>(() =>
      Dio());
  sl.registerLazySingleton<CompaniesApi>(() =>
      CompaniesApi(sl<Dio>()));
  sl.registerLazySingleton<Random>(() =>
      Random());
  
}