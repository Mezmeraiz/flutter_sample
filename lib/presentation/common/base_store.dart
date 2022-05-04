import 'package:mobx/mobx.dart';

part 'base_store.g.dart';

class BaseStore = BaseStoreBase with _$BaseStore;

abstract class BaseStoreBase with Store {
  @observable
  StoreState state = const StateInitial();

  @action
  void showContent() {
    state = const StateLoaded();
  }

  @action
  void showProgress() {
    state = const StateLoading();
  }

  @action
  void hideProgress() {
    state = const StateLoaded();
  }

  @action
  void showError({String errorText = "Unknown Error"}) {
    state = StateError(errorText: errorText);
  }
}

abstract class StoreState {
  const StoreState();
}

class StateInitial extends StoreState {
  const StateInitial();
}

class StateLoading extends StoreState {
  const StateLoading();
}

class StateLoaded extends StoreState {
  const StateLoaded();
}

class StateError extends StoreState {
  String errorText;

  StateError({required this.errorText});
}
