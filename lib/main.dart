import 'package:flutter/material.dart' hide Router;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_sample/common/app_theme.dart';
import 'package:flutter_sample/common/inits.dart';
import 'package:flutter_sample/generated/l10n.dart';
import 'package:flutter_sample/navigation/main_router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const SampleApp());
}

class SampleApp extends StatefulWidget {
  const SampleApp({Key? key}) : super(key: key);

  @override
  SampleAppState createState() => SampleAppState();
}

class SampleAppState extends State<SampleApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: getStores(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Sample',
          theme: LightTheme.data,
          routeInformationParser: sl<MainRouter>().router.routeInformationParser,
          routerDelegate: sl<MainRouter>().router.routerDelegate,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
        ));
  }
}
