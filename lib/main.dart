import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_sample/common/app_theme.dart';
import 'package:flutter_sample/common/inits.dart';
import 'package:flutter_sample/generated/l10n.dart';
import 'package:flutter_sample/navigation/main_router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(SampleApp(
    injects: await getInjects(),
    blocs: getBlocProviders(),
    mainRouter: getMainRouter(),
  ));
}

class SampleApp extends StatelessWidget {
  List<Provider> injects;
  List<BlocProvider> blocs;
  MainRouter mainRouter;

  SampleApp({Key? key, required this.injects, required this.blocs, required this.mainRouter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: injects,
        child: MultiBlocProvider(
            providers: blocs,
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Sample',
              theme: LightTheme.data,
              routerDelegate: mainRouter.delegate(),
              routeInformationParser: mainRouter.defaultRouteParser(),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
            )));
  }
}
