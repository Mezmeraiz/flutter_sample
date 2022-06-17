import 'package:flutter_sample/domain/entities/photo.dart';
import 'package:flutter_sample/domain/entities/user.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';

abstract class UserRouterRepository {
  User get user;

  BehaviorSubject<LatLng?> get markerPositionStreamController;

  BehaviorSubject<Set<Photo>> get selectedPhotosStreamController;
}
