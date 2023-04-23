import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/di/dependency_scope.dart';
import 'package:flutter_sample/feature/auth/auth_bloc.dart';
import 'package:flutter_sample/feature/auth/auth_event.dart';
import 'package:flutter_sample/feature/auth/auth_state.dart';
import 'package:flutter_sample/generated/l10n.dart';
import 'package:flutter_sample/router/configurations/root/main_configuration.dart';
import 'package:flutter_sample/router/scope/root_router_scope.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DependencyScope.getBlocFactory(context).authBloc,
      child: const AuthView(),
    );
  }
}

class AuthView extends StatelessWidget {
  const AuthView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocListener<AuthBloc, AuthState>(
        listenWhen: (prev, curr) => prev.action != curr.action && curr.action != AuthAction.none,
        listener: (context, state) {
          if (state.action == AuthAction.authorized) {
            RootRouterScope.of(context).navigate(MainConfiguration());
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(S.current.authorization),
          ),
          body: Center(
            child: TextButton(
              onPressed: () => _onTapLogin(context),
              child: Text(S.current.login),
            ),
          ),
        ),
      );

  void _onTapLogin(BuildContext context) => context.read<AuthBloc>().add(const AuthEvent.login());
}
