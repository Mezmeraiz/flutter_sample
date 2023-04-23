import 'package:bloc/bloc.dart';
import 'package:flutter_sample/data/auth_repository.dart';
import 'package:flutter_sample/feature/auth/auth_event.dart';
import 'package:flutter_sample/feature/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({
    required this.authRepository,
  }) : super(const AuthState()) {
    on<Login>(_login);
  }

  Future<void> _login(
    Login event,
    Emitter<AuthState> emit,
  ) async {
    await authRepository.login();
    emit(state.copyWith(
      action: AuthAction.authorized,
    ));
  }
}
