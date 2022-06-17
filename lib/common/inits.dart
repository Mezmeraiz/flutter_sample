import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/data/api/error_api.dart';
import 'package:flutter_sample/data/api/photos_api.dart';
import 'package:flutter_sample/data/api/users_api.dart';
import 'package:flutter_sample/data/db/db.dart';
import 'package:flutter_sample/data/db/notes_dao.dart';
import 'package:flutter_sample/data/db/notes_dao_impl.dart';
import 'package:flutter_sample/data/geo_repository.dart';
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
import 'package:flutter_sample/presentation/screens/note/bloc/note_bloc.dart';
import 'package:flutter_sample/data/geo_repository_impl.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import '../data/photos_repository_impl.dart';

Future<List<Provider>> getInjects() async => [
  ...(await getDatabaseProviders()),
  ...getApiProviders(),
  ...getRepositoryProviders(),
  ...getInteractorProviders(),
];

Future<List<Provider>> getDatabaseProviders() async => [
      Provider<Database>.value(value: await DB().open()),
      Provider<NotesDAO>(create: (context) => NotesDAOImpl(context.read<Database>())),
    ];

List<Provider> getApiProviders() => [
  Provider<Dio>(create: (context) => Dio()),
  Provider<UsersApi>(create: (context) => UsersApi(context.read<Dio>())),
  Provider<PhotosApi>(create: (context) => PhotosApi(context.read<Dio>())),
  Provider<ErrorApi>(create: (context) => ErrorApi(context.read<Dio>())),
];

List<Provider> getRepositoryProviders()  => [
  Provider<UsersRepository>(create: (context) => UsersRepositoryImpl(usersApi: context.read<UsersApi>(), errorApi: context.read<ErrorApi>())),
  Provider<PhotosRepository>(create: (context) => PhotosRepositoryImpl(photosApi: context.read<PhotosApi>())),
  Provider<NotesRepository>(create: (context) => NotesRepositoryImpl(notesDAO: context.read<NotesDAO>())),
  Provider<GeoRepository>.value(value: GeoRepositoryImpl()),
];

List<Provider> getInteractorProviders() => [
  Provider<UsersInteractor>(create: (context) => UsersInteractorImpl(usersRepository: context.read<UsersRepository>())),
  Provider<PhotosInteractor>(create: (context) => PhotosInteractorImpl(photosRepository: context.read<PhotosRepository>())),
  Provider<NotesInteractor>(create: (context) => NotesInteractorImpl(notesRepository: context.read<NotesRepository>())),
];

List<BlocProvider> getBlocProviders() {
  return [
    BlocProvider<NoteBloc>(create: (context) => NoteBloc(notesInteractor: context.read<NotesInteractor>()))
  ];
}
