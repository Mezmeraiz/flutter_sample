import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_sample/common/observer.dart';
import 'package:flutter_sample/di/common/initialization_helper.dart';
import 'package:flutter_sample/di/common/initialization_result.dart';
import 'package:flutter_sample/di/dependency_scope.dart';
import 'package:flutter_sample/feature/settings/settings_scope.dart';
import 'package:flutter_sample/generated/l10n.dart';
import 'package:flutter_sample/router/scope/root_router_scope.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  Bloc.observer = SampleBlocObserver(scaffoldMessengerKey: scaffoldMessengerKey);

  InitializationHelper initializationHelper = kIsWeb ? InitializationHelperWeb() : InitializationHelperIo();
  InitializationResult result = await initializationHelper.init();

  runApp(
    DependencyScope(
      dependenciesFactory: result.dependenciesFactory,
      blocFactory: result.blocFactory,
      child: RootRouterScope(
        routerDelegate: result.dependenciesFactory.rootRouterDelegate,
        child: SettingsScope(
          storage: result.dependenciesFactory.storage,
          child: SampleApp(
            scaffoldMessengerKey: scaffoldMessengerKey,
          ),
        ),
      ),
    ),
  );
}

class SampleApp extends StatelessWidget {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  const SampleApp({
    Key? key,
    required this.scaffoldMessengerKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: 'Flutter Sample',
        scaffoldMessengerKey: scaffoldMessengerKey,
        theme: DependencyScope.getDependenciesFactory(context).lightThemeData,
        darkTheme: DependencyScope.getDependenciesFactory(context).darkThemeData,
        themeMode: SettingsScope.getCurrentTheme(context),
        routerDelegate: DependencyScope.getDependenciesFactory(context).rootRouterDelegate,
        routeInformationParser: DependencyScope.getDependenciesFactory(context).rootRouteInformationParser,
        routeInformationProvider: DependencyScope.getDependenciesFactory(context).rootRouteInformationProvider,
        backButtonDispatcher: DependencyScope.getDependenciesFactory(context).rootBackButtonDispatcher,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      );
}
