import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iitm_app/src/map/controller/location_controller.dart';
import 'package:iitm_app/src/map/controller/map_controller.dart';

class MapPage extends StatelessWidget {
  final LocationController locationController = Get.put(LocationController());
  final MapController mapController = Get.put(MapController());

  MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Location'),
      ),
      body: GetX<LocationController>(
        builder: (controller) {
          return SizedBox(
            height: 690,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                googleMap(context),
                saveSheet(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget googleMap(BuildContext context) {
    return GoogleMap(
      onTap: (value) {
        locationController.updateCurrentLocation(value);
      },
      onMapCreated: (GoogleMapController controller) {
        mapController.updateMapController(controller);
      },
      initialCameraPosition: mapController.initialCameraPosition.value,
      markers: {
        Marker(
          draggable: true,
          markerId: const MarkerId('1'),
          position: mapController.selectedLocation.value,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          onDragEnd: (value) {
            locationController.updateCurrentLocation(value);
          },
        ),
      },
    );
  }

  Widget saveSheet() {
    return Positioned(
      bottom: 0,
      child: Container(
        width: 375,
        height: 250,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            containerAppBar(),
            innerContainerWidget(),
          ],
        ),
      ),
    );
  }

  Widget containerAppBar() {
    return const Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Text(
          "Your Address/Location",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget innerContainerWidget() {
    return Container(
      height: 145,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          searchBar(),
          currentLocation(),
        ],
      ),
    );
  }

  Widget searchBar() {
    return Container(
      height: 50,
      width: 360,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() =>
              locationController.currentLocation.value == const LatLng(0, 0)
                  ? const CircularProgressIndicator(
                      color: Colors.blue,
                      strokeWidth: 2,
                    )
                  : Image.asset(
                      'assets/icons/search-50.png',
                      height: 20,
                      width: 20,
                      color: Colors.grey.shade700,
                    )),
          SizedBox(
            width: 275,
            child: TextField(
              onSubmitted: (String val) {
                // Implement search functionality
              },
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(left: 10, right: 10, bottom: 2),
                hintText: "Search for area, street name...",
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget currentLocation() {
    return GestureDetector(
      onTap: () {
        // Implement current location functionality
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            5,
          ),
        ),
        child: const Row(
          children: [
            Icon(
              Icons.my_location,
              color: Colors.blue,
              size: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Use Current Location",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
