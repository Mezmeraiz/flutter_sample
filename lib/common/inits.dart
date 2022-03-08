
import 'package:dio/dio.dart';
import 'package:flutter_sample/data/api/photos_api.dart';
import 'package:flutter_sample/data/api/users_api.dart';
import 'package:flutter_sample/data/db/db.dart';
import 'package:flutter_sample/data/db/notes_dao.dart';
import 'package:flutter_sample/data/db/notes_dao_impl.dart';
import 'package:flutter_sample/data/notes_repository.dart';
import 'package:flutter_sample/data/notes_repository_impl.dart';
import 'package:flutter_sample/data/photos_repository.dart';
import 'package:flutter_sample/data/users_repository.dart';
import 'package:flutter_sample/data/users_repository_impl.dart';
import 'package:flutter_sample/domain/notes_interactor.dart';
import 'package:flutter_sample/domain/notes_interactor_impl.dart';
import 'package:flutter_sample/domain/photos_interactor.dart';
import 'package:flutter_sample/domain/photos_interactor_impl.dart';
import 'package:flutter_sample/domain/users_interactor.dart';
import 'package:flutter_sample/domain/users_interactor_impl.dart';
import 'package:flutter_sample/navigation/main_router/main_router_parser.dart';
import 'package:flutter_sample/navigation/screen_factory.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

import '../data/photos_repository_impl.dart';

final sl = GetIt.instance;

setup() async {
  sl.registerSingleton<ScreenFactory>(ScreenFactory());
  sl.registerSingleton<MainRouterParser>(MainRouterParser());
  sl.registerLazySingleton<Dio>(() => Dio());
  await registerDatabase();
  registerApi();
  registerRepository();
  registerInteractor();
}

registerDatabase() async {
  sl.registerSingleton<Database>(await DB().open());
  sl.registerLazySingleton<NotesDAO>(() => NotesDAOImpl(sl<Database>()));
}

registerApi() {
  sl.registerLazySingleton<UsersApi>(() => UsersApi(sl<Dio>()));
  sl.registerLazySingleton<PhotosApi>(() => PhotosApi(sl<Dio>()));
}

registerRepository() {
  sl.registerLazySingleton<UsersRepository>(
      () => UsersRepositoryImpl(usersApi: sl()));
  sl.registerLazySingleton<PhotosRepository>(
      () => PhotosRepositoryImpl(photosApi: sl<PhotosApi>()));
  sl.registerLazySingleton<NotesRepository>(
      () => NotesRepositoryImpl(notesDAO: sl<NotesDAO>()));
}

registerInteractor() {
  sl.registerLazySingleton<UsersInteractor>(
      () => UsersInteractorImpl(usersRepository: sl()));
  sl.registerLazySingleton<PhotosInteractor>(
      () => PhotosInteractorImpl(photosRepository: sl()));
  sl.registerLazySingleton<NotesInteractor>(
      () => NotesInteractorImpl(notesRepository: sl()));
}
