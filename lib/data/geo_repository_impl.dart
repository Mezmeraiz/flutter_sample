import 'package:flutter_sample/data/geo_repository.dart';
import 'package:geolocator/geolocator.dart';

class GeoRepositoryImpl implements GeoRepository {

  Position? _currentPosition;

  @override
  get currentPosition => _currentPosition;

  GeoRepositoryImpl() {
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
      _currentPosition = position;
    });
  }
}
