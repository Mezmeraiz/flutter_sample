import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/data/db/db.dart';
import 'package:flutter_sample/di/backend_storage.dart';
import 'package:flutter_sample/di/database_storage.dart';
import 'package:flutter_sample/di/dependencies_storage.dart';
import 'package:flutter_sample/di/interactor_storage.dart';
import 'package:flutter_sample/di/repository_storage.dart';
import 'package:flutter_sample/navigation/main_router.dart';
import 'package:flutter_sample/presentation/screens/note/bloc/note_bloc.dart';
import 'package:provider/provider.dart';

Future<List<Provider>> getInjects() async => [
      await getDependenciesStorageProvider(),
      getDatabaseStorageProvider(),
      getBackendStorageProvider(),
      getRepositoryStorageProvider(),
      getInteractorStorageProvider(),
    ];

Future<Provider<DependenciesStorage>> getDependenciesStorageProvider() async {
  final database = await DB().open();
  return Provider<DependenciesStorage>(
      create: (context) => DependenciesStorageImpl(database: database));
}

Provider<DatabaseStorage> getDatabaseStorageProvider() {
  return Provider<DatabaseStorage>(
      create: (context) =>
          DatabaseStorageImpl(dependenciesStorage: context.read<DependenciesStorage>()));
}

Provider<BackendStorage> getBackendStorageProvider() {
  return Provider<BackendStorage>(
      create: (context) =>
          BackendStorageImpl(dependenciesStorage: context.read<DependenciesStorage>()));
}

Provider<RepositoryStorage> getRepositoryStorageProvider() {
  return Provider<RepositoryStorage>(
    create: (context) => RepositoryStorageImpl(
        databaseStorage: context.read<DatabaseStorage>(),
        backendStorage: context.read<BackendStorage>()),
  );
}

Provider<InteractorStorage> getInteractorStorageProvider() {
  return Provider<InteractorStorage>(
    create: (context) =>
        InteractorStorageImpl(repositoryStorage: context.read<RepositoryStorage>()),
  );
}

List<BlocProvider> getBlocProviders() {
  return [
    BlocProvider<NoteBloc>(create: (context) => NoteBloc(notesInteractor: context.read<InteractorStorage>().notesInteractor))
  ];
}

MainRouter getMainRouter() => MainRouter();