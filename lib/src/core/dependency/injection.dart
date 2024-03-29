import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/core/services/services.dart';
import 'package:iitm_app/src/features/auth/controller/auth_controller.dart';
import 'package:iitm_app/src/features/auth/controller/user_data_controller.dart';
import 'package:iitm_app/src/features/auth/controller/user_details_controller.dart';
import 'package:iitm_app/src/features/auth/presentation/widgets/user_location_container.dart';
import 'package:iitm_app/src/features/weather/controller/weather_controller.dart';

class DependencyInjection {
  static Future<void> initialiseFireBase() async {
    await Services.initialiseFireBase();
  }

  //
  static Future<void> getControllersInjection() async {
    Get.put(AuthController());
    Get.put(UserDataController());
    Get.put(UserDetailsController());
    Get.put(const UserLocationContainer());
    Get.put(WeatherController());
  }

  static Future<void> initialise() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initialiseFireBase();
    await getControllersInjection();
  }
}
