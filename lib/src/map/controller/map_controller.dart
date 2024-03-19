import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  final Rx<Completer<GoogleMapController>> mapController =
      Completer<GoogleMapController>().obs;

  final Rx<CameraPosition> initialCameraPosition =
      const CameraPosition(target: LatLng(0, 0), zoom: 12).obs;

  final Rx<LatLng> selectedLocation = const LatLng(0, 0).obs;

  void updateMapController(GoogleMapController controller) {
    mapController.value.complete(controller);
  }

  void updateInitialCameraPosition(CameraPosition position) {
    initialCameraPosition.value = position;
  }

  void updateSelectedLocation(LatLng location) {
    selectedLocation.value = location;
  }
}
