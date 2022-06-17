import 'package:geolocator/geolocator.dart';

abstract class GeoRepository {
  Position? get currentPosition;
}
