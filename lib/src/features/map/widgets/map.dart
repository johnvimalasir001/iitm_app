import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iitm_app/src/features/map/controller/user_location_controller.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LocationController locationController = Get.put(LocationController());
  final Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    super.initState();
    locationController.getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: GoogleMap(
              zoomControlsEnabled: true,
              initialCameraPosition: locationController.postion.value,
              markers: {locationController.userMarker.value},
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              // onCameraMove: (CameraPosition position) {
              //   // locationController.updateMarkerPosition(position.target);
              //   // locationController.updateCameraPosition(position.target);
              // },
            ),
          );
        },
      ),
    );
  }
}
