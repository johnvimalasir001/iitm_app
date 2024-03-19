import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  final Rx<LatLng> currentLocation = LatLng(0, 0).obs;

  void updateCurrentLocation(LatLng location) {
    currentLocation.value = location;
  }
}