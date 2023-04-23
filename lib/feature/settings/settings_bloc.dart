import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_sample/data/auth_repository.dart';
import 'package:flutter_sample/feature/settings/settings_event.dart';
import 'package:flutter_sample/feature/settings/settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final AuthRepository authRepository;

  SettingsBloc({required this.authRepository}) : super(const SettingsState()) {
    on<Logout>(_logout, transformer: droppable());
  }

  Future<void> _logout(
    Logout event,
    Emitter<SettingsState> emit,
  ) async {
    await authRepository.logout();
    emit(state.copyWith(
      action: SettingsAction.logout,
    ));
  }
}
