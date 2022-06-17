import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_router_bloc.freezed.dart';

@freezed
class UserRouterEvent with _$UserRouterEvent {
  const UserRouterEvent._();

  const factory UserRouterEvent.action({required UserRouterAction action}) = ActionUserRouterEvent;

  const factory UserRouterEvent.reSelection({required bool reSelection}) =
      ReSelectionUserRouterEvent;
}

@freezed
class UserRouterState with _$UserRouterState {
  const factory UserRouterState(
      {required UserRouterAction action,
      required bool reSelection,
      int? timestamp}) = _UserRouterState;
}

class UserRouterBloc extends Bloc<UserRouterEvent, UserRouterState> {
  UserRouterBloc()
      : super(const UserRouterState(
            action: UserRouterAction.initial, reSelection: false, timestamp: 0)) {
    on<ActionUserRouterEvent>(_action);
    on<ReSelectionUserRouterEvent>(_reSelection);
  }

  Future<void> _action(
    ActionUserRouterEvent event,
    Emitter<UserRouterState> emit,
  ) async {
    emit(state.copyWith(action: event.action, timestamp: DateTime.now().millisecondsSinceEpoch));
  }

  Future<void> _reSelection(
    ReSelectionUserRouterEvent event,
    Emitter<UserRouterState> emit,
  ) async {
    emit(state.copyWith(reSelection: event.reSelection));
  }
}

enum UserRouterAction { initial, next, backToPhoto, backToMap, close, rebuild }
