import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/auth/widgets/custom_title.dart';
import 'package:iitm_app/src/features/map/controller/user_location_controller.dart';

class UserLocationContainer extends StatelessWidget {
  const UserLocationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationController locationController = LocationController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTitle(title: "Your Location"),
        SizedBox(
          height: 5.h,
        ),
        Obx(() {
          String location = locationController.address.value;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40.h,
                width: 220.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      location,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  locationController.getCurrentLocation();
                },
                child: Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.my_location,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
