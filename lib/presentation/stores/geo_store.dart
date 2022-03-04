import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';

part 'geo_store.g.dart';

class GeoStore = GeoStoreBase with _$GeoStore;

abstract class GeoStoreBase with Store {
  @observable
  Position? currentPosition;

  GeoStoreBase() {
    startLocationUpdates();
  }

  startLocationUpdates() async {
    var permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.always &&
        permission != LocationPermission.whileInUse) return;
    var locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position? position) {
      currentPosition = position;
    });
  }
}
