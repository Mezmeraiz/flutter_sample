import 'package:dio/dio.dart';
import 'package:flutter_sample/domain/entities/user.dart';
import 'package:flutter_sample/domain/users_interactor.dart';
import 'package:flutter_sample/presentation/common/base_store.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase extends BaseStore with Store {
  final String? _gender;

  final UsersInteractor _userInteractor;

  UserStoreBase(this._gender, this._userInteractor) {
    getUsers();
  }

  @observable
  var users = ObservableList<User>();

  @action
  getUsers() async {
    try {
      users.addAll(await _userInteractor.getUsersByGender(_gender));
      showContent();
    } on DioError catch (e) {
      showError(errorText: e.message);
    }
  }
}
