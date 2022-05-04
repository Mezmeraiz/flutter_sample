import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

class ProfileStore = ProfileStoreBase with _$ProfileStore;

abstract class ProfileStoreBase with Store {
  // final String? _gender;
  //
  // final ProfilesInteractor _ProfileInteractor;
  //
  // ProfileStoreBase(this._gender, this._ProfileInteractor) {
  //   getProfiles();
  // }
  //
  // @observable
  // var Profiles = ObservableList<Profile>();
  //
  // @action
  // getProfiles() async {
  //   Profiles.addAll(await _ProfileInteractor.getProfilesByGender(_gender));
  // }
}
