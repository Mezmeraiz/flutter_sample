import 'package:bloc/bloc.dart';
import 'package:flutter_sample/domain/entities/user.dart';
import 'package:flutter_sample/domain/users_interactor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';

part 'user_bloc.freezed.dart';

@freezed
class UserEvent with _$UserEvent {
  const UserEvent._();

  const factory UserEvent.fetch() = FetchUserEvent;
}

@freezed
class UserState with _$UserState {
  const UserState._();

  List<User> get users => map(
    initial: (_) => [],
    fetched: (state) => state.users,
    error: (state) => [],
  );

  const factory UserState.initial() = InitialUserState;

  const factory UserState.fetched({required List<User> users}) = FetchedUserState;

  const factory UserState.error({String? message}) = ErrorUserState;
}

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required this.gender, required this.userInteractor}) : super(const InitialUserState()) {
    on<FetchUserEvent>(_fetch);
  }

  final String? gender;

  final UsersInteractor userInteractor;

  Future<void> _fetch(
    FetchUserEvent event,
    Emitter<UserState> emit,
  ) async {
    try {
      final users = await userInteractor.getUsersByGender(gender);
      emit(UserState.fetched(users: users));
    } on DioError catch (e) {
      emit(UserState.error(message: e.message));
    } catch (_) {
      emit(const UserState.error());
    }
  }
}