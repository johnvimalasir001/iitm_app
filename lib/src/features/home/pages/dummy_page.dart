import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/home/controller/realtimedatabase_controller.dart';

class Dummypage extends StatelessWidget {
  const Dummypage({super.key});

  @override
  Widget build(BuildContext context) {
    final RealtimeDataController controller = Get.find();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() {
            controller.fetchData();
            return Center(child: Text('Data: ${controller.data.value}'));
          }),
        ],
      ),
    );
  }
}
