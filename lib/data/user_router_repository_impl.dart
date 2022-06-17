import 'package:flutter_sample/data/user_router_repository.dart';
import 'package:flutter_sample/domain/entities/photo.dart';
import 'package:flutter_sample/domain/entities/user.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';

class UserRouterRepositoryImpl implements UserRouterRepository {
  UserRouterRepositoryImpl({required this.user});

  @override
  final User user;

  @override
  final BehaviorSubject<LatLng?> markerPositionStreamController = BehaviorSubject();

  @override
  final BehaviorSubject<Set<Photo>> selectedPhotosStreamController = BehaviorSubject.seeded({});
}
