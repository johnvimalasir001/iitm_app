import 'dart:developer';

import 'package:get/get.dart';
import 'package:iitm_app/src/core/api/api_fetch.dart';
import 'package:iitm_app/src/features/auth/controller/user_data_controller.dart';
import 'package:iitm_app/src/features/weather/models/weather_model.dart';

class WeatherController extends GetxController {
  final UserDataController userDataContrller = Get.find();

  final minuteDataList = <MinuteData>[].obs;

  @override
  void onInit() {
    super.onInit();
    userDataContrller.getUserDetails();
    fetchData();
  }

  void fetchData() async {
    try {
      await userDataContrller.getUserDetails();

      var data = await FetchWeatherData().fetchData(10.416541, 77.900532
          // userDataContrller.userDetails[0].latitude!,
          // userDataContrller.userDetails[0].longitude!,
          );

      minuteDataList.assignAll(data);
    } catch (e) {
      log("Error fetching weather data: $e");
    }
  }
}
