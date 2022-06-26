import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/data/user_router_repository.dart';
import 'package:flutter_sample/di/repository_storage.dart';
import 'package:flutter_sample/generated/l10n.dart';
import 'package:flutter_sample/navigation/custom_user_router/user_router_bloc.dart';
import 'package:flutter_sample/presentation/screens/map/bloc/map_bloc.dart';
import 'package:flutter_sample/presentation/views/next_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapBloc(
        geoRepository: context.read<RepositoryStorage>().geoRepository,
        userRouterRepository: context.read<UserRouterRepository>(),
      ),
      child: const MapScreenView(),
    );
  }
}

class MapScreenView extends StatelessWidget {
  const MapScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.current.position)),
      body: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          final initialCameraPosition = CameraPosition(
            target: LatLng(
              state.initialPosition?.latitude ?? 55.751244,
              state.initialPosition?.longitude ?? 37.618423,
            ),
            zoom: 11,
          );
          return Stack(
            children: [
              GoogleMap(
                initialCameraPosition: initialCameraPosition,
                onTap: (latLng) => _onSelectPosition(context, latLng),
                markers: _getMarkers(state.markerPosition),
              ),
              NextButton(
                isNotEmpty: state.markerPosition != null,
                onTap: () => _onTapNext(context),
              ),
            ],
          );
        },
      ),
    );
  }

  void _onSelectPosition(BuildContext context, LatLng latLng) =>
      context.read<MapBloc>().add(MapEvent.selectPosition(markerPosition: latLng));

  void _onTapNext(BuildContext context) => context
      .read<UserRouterBloc>()
      .add(const UserRouterEvent.action(action: UserRouterAction.next));

  Set<Marker> _getMarkers(LatLng? markerPosition) {
    var markers = markerPosition != null
        ? {Marker(markerId: const MarkerId("marker_id"), position: markerPosition)}
        : <Marker>{};
    return markers;
  }
}
