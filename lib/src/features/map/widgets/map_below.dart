import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iitm_app/src/features/auth/widgets/userdetail.dart';

import 'package:iitm_app/src/features/map/controller/user_location_controller.dart';

class MapBelow extends StatefulWidget {
  const MapBelow({super.key});

  @override
  State<MapBelow> createState() => _MapBelowState();
}

class _MapBelowState extends State<MapBelow> {
  LocationController locationController = Get.put(LocationController());
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 200.h,
        width: 350.h,
        padding: EdgeInsets.all(25.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Your Address/Location",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: SearchBar(
                onSubmitted: (value) {
                  if (value.isEmpty) {
                    return;
                  } else {
                    locationController.searchToLoaction(value);
                    locationController.coordinateToAddress();
                  }
                },
                padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
                backgroundColor: MaterialStateProperty.all(
                  Colors.grey.shade100,
                ),
                leading: const Icon(Icons.search),
                hintText: "Search for area, street name...",
              ),
            ),
            GestureDetector(
              onTap: () async {
                locationController.getCurrentLocation();
                locationController.coordinateToAddress();
                // CameraPosition cameraPosition = CameraPosition(
                //   target: LatLng(locationController.latitude.value,
                //       locationController.longitude.value),
                //   zoom: 14,
                // );

                // final GoogleMapController controller = await _controller.future;
                // controller.animateCamera(
                //     CameraUpdate.newCameraPosition(cameraPosition));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserDetails()));
              },
              child: Container(
                height: 20.h,
                width: 250.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.my_location_outlined,
                      color: Colors.blue,
                    ),
                    Text(
                      "Use my current location",
                      strutStyle: const StrutStyle(
                        height: 1.5,
                      ),
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
