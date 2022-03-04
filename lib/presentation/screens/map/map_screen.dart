import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_sample/common/colors.dart';
import 'package:flutter_sample/navigation/user_router/user_router_store.dart';
import 'package:flutter_sample/presentation/screens/map/store/map_store.dart';
import 'package:flutter_sample/presentation/screens/save_user/save_user_screen.dart';
import 'package:flutter_sample/presentation/stores/geo_store.dart';
import 'package:flutter_sample/presentation/views/action_button.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  static const route = "map";

  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final GeoStore _geoStore;

  late final MapStore _mapStore;

  late final UserRouterStore _userRouterStore;

  late final CameraPosition _initialCameraPosition;

  @override
  void initState() {
    super.initState();
    _geoStore = context.read<GeoStore>();
    _mapStore = context.read<MapStore>();
    _userRouterStore = context.read<UserRouterStore>();
    _initialCameraPosition = CameraPosition(
        target: LatLng(_geoStore.currentPosition?.latitude ?? 55.751244,
            _geoStore.currentPosition?.longitude ?? 37.618423),
        zoom: 11);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Position"),
      ),
      body: Observer(builder: (_) {
        return Stack(
          children: [
            GoogleMap(
              initialCameraPosition: _initialCameraPosition,
              onTap: _mapStore.onTapMap,
              markers: getMarkers(),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              left: 16,
              right: 16,
              bottom: _mapStore.markerPosition != null ? 16 : -100,
              child: ActionButton(
                  title: "Далее",
                  onTap: () => _userRouterStore.currentAction = UserRouterAction.next)
            )
          ],
        );
      }),
    );
  }

  getMarkers() {
    var markers = _mapStore.markerPosition != null
        ? {
            Marker(
                markerId: const MarkerId("marker_id"),
                position: _mapStore.markerPosition!)
          }
        : <Marker>{};
    return markers;
  }
}
