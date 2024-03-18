import 'dart:async';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  RxDouble latitude = 9.939093.obs;
  RxDouble longitude = 78.121719.obs;
  RxString address = "".obs;

  RxBool isLoading = false.obs;
  Rx<Marker> userMarker = const Marker(
    markerId: MarkerId('user'),
    position: LatLng(0, 0),
  ).obs;

  Rx<CameraPosition> postion = const CameraPosition(
    target: LatLng(9.939093, 78.121719),
    zoom: 13,
  ).obs;

  void updateCameraPosition(LatLng userPosition) {
    postion.value = CameraPosition(
      target: userPosition,
      zoom: postion.value.zoom,
    );
    print("${postion.value}");
  }

  void updateMarkerPosition(LatLng newPosition) {
    userMarker.value = userMarker.value.copyWith(positionParam: newPosition);
    print("${userMarker.value}");
  }

  Future getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    isLoading.value = true;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error("location service is not enabled");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("location permissions denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("location permissions permanently denied");
    }
    var result =
        Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
            .then(
      (value) async {
        latitude.value = value.latitude;
        longitude.value = value.longitude;
        isLoading.value = false;
        // List<Placemark> p =
        //     await placemarkFromCoordinates(value.latitude, value.longitude);
        // Placemark place = p[0];
        // address.value = place.locality!;
        final coordinates = Coordinates(value.latitude, value.longitude);
        var addresses =
            await Geocoder.local.findAddressesFromCoordinates(coordinates);
        if (addresses.isNotEmpty) {
          address.value = addresses.first.addressLine ?? "";
         
        } else {
          print("No address found for the coordinates");
        }

        print("latidue: ${latitude.value}");
        print("Longitude: ${longitude.value}");
        print("address: $address");
        update();
      },
    );

    return result;
  }

  Future searchToLoaction(String address) async {
    var location = await locationFromAddress(address);
    latitude.value = location[0].latitude;
    longitude.value = location[0].longitude;

    print("Search :$latitude");
    print("Search :$longitude");
  }

  void coordinateToAddress() async {
    final coordinates = Coordinates(latitude.value, longitude.value);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    if (addresses.isNotEmpty) {
      address.value = addresses.first.addressLine ?? "";
      print("address: ${address.value}");
    } else {
      print("No address found for the coordinates");
    }
  }
}
