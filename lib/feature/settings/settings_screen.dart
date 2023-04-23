import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/di/dependency_scope.dart';
import 'package:flutter_sample/feature/settings/settings_bloc.dart';
import 'package:flutter_sample/feature/settings/settings_event.dart';
import 'package:flutter_sample/feature/settings/settings_scope.dart';
import 'package:flutter_sample/feature/settings/settings_state.dart';
import 'package:flutter_sample/feature/settings/widgets/logout_widget.dart';
import 'package:flutter_sample/feature/settings/widgets/theme_mode_selector.dart';
import 'package:flutter_sample/feature/settings/widgets/theme_widget.dart';
import 'package:flutter_sample/generated/l10n.dart';
import 'package:flutter_sample/router/configurations/root/auth_configuration.dart';
import 'package:flutter_sample/router/scope/root_router_scope.dart';
import 'package:flutter_sample/view/common/bottom_sheet/show_default_bottom_sheet.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => DependencyScope.getBlocFactory(context).settingsBloc,
        child: const SettingsView(),
      );
}

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  SettingsViewState createState() => SettingsViewState();
}

class SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(S.current.settings),
        ),
        body: BlocListener<SettingsBloc, SettingsState>(
          listenWhen: (prev, curr) => prev.action != curr.action && curr.action != SettingsAction.none,
          listener: (context, state) {
            if (state.action == SettingsAction.logout) {
              _onLogout();
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ThemeWidget(onThemePressed: _onThemePressed),
              const Divider(),
              LogoutWidget(onTapLogout: _onTapLogout),
            ],
          ),
        ),
      );

  void _onTapLogout() => context.read<SettingsBloc>().add(const SettingsEvent.logout());

  void _onLogout() => RootRouterScope.of(context).navigate(AuthConfiguration());

  void _onThemePressed() async {
    ThemeMode? result = await _showThemeModeSelector(context) as ThemeMode?;
    if (result != null) {
      SettingsScope.switchThemeMode(context, result);
    }
  }

  Future<dynamic> _showThemeModeSelector(BuildContext context) async => showDefaultBottomSheet(
        context: context,
        body: const ThemeModeSelector(),
      );
}
