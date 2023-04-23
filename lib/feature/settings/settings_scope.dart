import 'package:flutter/material.dart';
import 'package:flutter_sample/data/storage/storage.dart';

class SettingsScope extends StatefulWidget {
  final Widget child;
  final Storage storage;

  const SettingsScope({
    Key? key,
    required this.child,
    required this.storage,
  }) : super(key: key);

  @override
  State<SettingsScope> createState() => _SettingsScopeState();

  static void switchThemeMode(BuildContext context, ThemeMode themeMode) =>
      _stateOf(context).switchThemeMode(themeMode);

  static ThemeMode getCurrentTheme(BuildContext context) => _stateOf(context).themeMode;

  static _SettingsScopeState _stateOf(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<_InheritedSettingsScope>() as _InheritedSettingsScope).state;
}

class _SettingsScopeState extends State<SettingsScope> {
  late ThemeMode themeMode;

  @override
  void initState() {
    super.initState();
    themeMode = widget.storage.themeMode;
  }

  @override
  Widget build(BuildContext context) => _InheritedSettingsScope(
        state: this,
        themeMode: themeMode,
        child: widget.child,
      );

  Future<void> switchThemeMode(ThemeMode themeMode) async {
    await widget.storage.saveThemeMode(themeMode);
    setState(() {
      this.themeMode = themeMode;
    });
  }
}

class _InheritedSettingsScope extends InheritedWidget {
  final _SettingsScopeState state;
  final ThemeMode themeMode;

  const _InheritedSettingsScope({
    required Widget child,
    required this.state,
    required this.themeMode,
  }) : super(child: child);

  @override
  bool updateShouldNotify(covariant _InheritedSettingsScope oldWidget) => oldWidget.themeMode != themeMode;
}
