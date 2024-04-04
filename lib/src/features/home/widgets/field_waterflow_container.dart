import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/home/controller/home_controller.dart';

class FieldWaterflowContainer extends StatelessWidget {
  const FieldWaterflowContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return Container(
      height: 76.h,
      width: 100.w,
      decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Obx(() {
                  homeController.fetchFieldWaterFlowData();
                  String value = homeController.average.value.toString();
                  return Text(
                    value,
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  );
                }),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 5),
                  child: Text(
                    'L/min',
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            Text(
              'titleFieldFlow'.tr,
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
