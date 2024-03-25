import 'package:get/get.dart';
import 'package:iitm_app/src/features/auth/controller/auth_controller.dart';
import 'package:iitm_app/src/features/auth/controller/user_data_controller.dart';
import 'package:iitm_app/src/features/auth/controller/user_details_controller.dart';
import 'package:iitm_app/src/features/auth/widgets/user_location_container.dart';
import 'package:iitm_app/src/features/weather/controller/weather_controller.dart';

class Injections {
  Future<void> getControllersInjection() async {
    Get.put(AuthController());
    Get.put(UserDataController());
    Get.put(UserDetailsController());
    Get.put(  UserLocationContainer());
    Get.put(WeatherController());
  }
}
