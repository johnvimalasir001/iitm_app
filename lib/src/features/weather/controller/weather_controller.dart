import 'package:get/get.dart';
import 'package:iitm_app/src/core/api/api_fetch.dart';
import 'package:iitm_app/src/features/auth/controller/user_data_controller.dart';
import 'package:iitm_app/src/features/weather/models/weather_model.dart';

class WeatherController extends GetxController {
  final UserDataController userDataContrller = Get.put(UserDataController());

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
      var data = await FetchWeatherData().fetchData(
          userDataContrller.userDetails[0].latitude!,
          userDataContrller.userDetails[0].longitude!,
          );
      minuteDataList.assignAll(data);
      print(data);
    } catch (e) {
      print('Error fetching weather data: $e');
    }
  }
}
