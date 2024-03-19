import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/auth/controller/user_details_controller.dart';

class MyDropdown extends StatelessWidget {
  final UserDetailsController controller = Get.put(UserDetailsController());

  MyDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GetBuilder<UserDetailsController>(
              builder: (values) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  values.selectedUnit,
                ),
              ),
            ),
          ),
          PopupMenuButton<String>(
            color: Colors.white,
            icon: const Icon(Icons.keyboard_arrow_down),
            onSelected: (String item) {
              controller.updateSelectedUnit(item);
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                value: "Cent",
                child: Text("Cent"),
              ),
              const PopupMenuItem(
                value: "Sqft",
                child: Text("Sqft"),
              ),
              const PopupMenuItem(
                value: "Acre",
                child: Text("Acre"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
