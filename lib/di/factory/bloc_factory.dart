import 'package:flutter_sample/di/factory/repository_factory.dart';
import 'package:flutter_sample/feature/auth/auth_bloc.dart';
import 'package:flutter_sample/feature/cat/cat_bloc.dart';
import 'package:flutter_sample/feature/cat_info/cat_info_bloc.dart';
import 'package:flutter_sample/feature/saved_cat/saved_bloc.dart';
import 'package:flutter_sample/feature/settings/settings_bloc.dart';

abstract class BlocFactory {
  AuthBloc get authBloc;

  CatBloc get catBloc;

  SavedBloc get savedBloc;

  SettingsBloc get settingsBloc;

  CatInfoBloc getCatInfoBloc({
    required String id,
    required bool saved,
  });
}

class BlocFactoryImpl implements BlocFactory {
  final RepositoryFactory _repositoryFactory;

  BlocFactoryImpl({
    required RepositoryFactory repositoryFactory,
  }) : _repositoryFactory = repositoryFactory;

  @override
  AuthBloc get authBloc => AuthBloc(authRepository: _repositoryFactory.authRepository);

  @override
  CatBloc get catBloc => CatBloc(catRepository: _repositoryFactory.catRepository);

  @override
  SavedBloc get savedBloc => SavedBloc(
        catRepository: _repositoryFactory.catRepository,
        refreshSavedRepository: _repositoryFactory.refreshSavedRepository,
      );

  @override
  SettingsBloc get settingsBloc => SettingsBloc(authRepository: _repositoryFactory.authRepository);

  @override
  CatInfoBloc getCatInfoBloc({
    required String id,
    required bool saved,
  }) =>
      CatInfoBloc(
        id: id,
        saved: saved,
        catRepository: _repositoryFactory.catRepository,
        refreshSavedRepository: _repositoryFactory.refreshSavedRepository,
      );
}
