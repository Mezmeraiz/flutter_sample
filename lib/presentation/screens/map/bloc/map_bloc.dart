import 'package:bloc/bloc.dart';
import 'package:flutter_sample/data/geo_repository.dart';
import 'package:flutter_sample/data/user_router_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_bloc.freezed.dart';

@freezed
class MapEvent with _$MapEvent {
  const MapEvent._();

  const factory MapEvent.selectPosition({required LatLng markerPosition}) = SelectPositionEvent;
}

@freezed
class MapState with _$MapState {
  const factory MapState({Position? initialPosition, LatLng? markerPosition}) = _MapState;
}

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc({required this.geoRepository, required this.userRouterRepository})
      : super(MapState(initialPosition: geoRepository.currentPosition)) {
    on<SelectPositionEvent>(_selectPosition);
  }

  final GeoRepository geoRepository;
  final UserRouterRepository userRouterRepository;

  Future<void> _selectPosition(
    SelectPositionEvent event,
    Emitter<MapState> emit,
  ) async {
    userRouterRepository.markerPositionStreamController.add(event.markerPosition);
    emit(state.copyWith(markerPosition: event.markerPosition));
  }
}
