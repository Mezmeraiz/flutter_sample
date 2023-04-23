import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthAction.none) AuthAction action,
  }) = _AuthState;
}

enum AuthAction {
  none,
  authorized,
}
