import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/core/services/services.dart';
import 'package:iitm_app/src/features/auth/controller/auth_controller.dart';
import 'package:iitm_app/src/features/auth/controller/user_data_controller.dart';
import 'package:iitm_app/src/features/auth/controller/user_details_controller.dart';
import 'package:iitm_app/src/features/auth/controller/user_location_controller.dart';
import 'package:iitm_app/src/features/home/controller/home_controller.dart';
import 'package:iitm_app/src/features/home/controller/realtimedatabase_controller.dart';
import 'package:iitm_app/src/features/report/controller/report_controller.dart';
import 'package:iitm_app/src/features/weather/controller/weather_controller.dart';

class DependencyInjection {
  static Future<void> initialiseFireBase() async {
    await Services.initialiseFireBase();
  }

  //
  static Future<void> getControllersInjection() async {
    Get.put(UserDataController());
    Get.put(AuthController());
    Get.put(UserDetailsController());
    Get.put(LocationController());
    Get.put(WeatherController());
    Get.put(ReportController());
    Get.put(RealtimeDataController());
    Get.put(HomeController());
  }

  static Future<void> initialise() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initialiseFireBase();
    await getControllersInjection();
  }
}
