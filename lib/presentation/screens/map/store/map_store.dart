import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'map_store.g.dart';

class MapStore = MapStoreBase with _$MapStore;

abstract class MapStoreBase with Store {
  @observable
  LatLng? markerPosition;

  @action
  onTapMap(LatLng latLng) => markerPosition = latLng;
}
