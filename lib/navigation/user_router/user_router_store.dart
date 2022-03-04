import 'package:flutter_sample/domain/entities/user.dart';
import 'package:mobx/mobx.dart';

part 'user_router_store.g.dart';

class UserRouterStore = UserRouterStoreBase with _$UserRouterStore;

abstract class UserRouterStoreBase with Store {

  final User user;

  @observable
  UserRouterAction currentAction = UserRouterAction.initial;

  var reSelection = false;

  UserRouterStoreBase({required this.user});

}

enum UserRouterAction {
  initial, next, backToPhoto, backToMap, close, rebuild
}