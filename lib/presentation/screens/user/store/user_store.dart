import 'package:flutter_sample/domain/entities/user.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_sample/domain/users_interactor.dart';

part 'user_store.g.dart';

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {

  final String? _gender;

  final UsersInteractor _userInteractor;

  UserStoreBase(this._gender, this._userInteractor) {
    getUsers();
  }

  @observable
  var users = ObservableList<User>();

  @action
  getUsers() async{
    users.addAll(await _userInteractor.getUsersByGender(_gender));
  }
}