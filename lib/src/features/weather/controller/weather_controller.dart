import 'package:get/get.dart';
import 'package:iitm_app/src/core/api/api_fetch.dart';
import 'package:iitm_app/src/core/api/api_key.dart';
import 'package:iitm_app/src/features/weather/models/weather_model.dart';

class WeatherController extends GetxController {
  double lat = 42.3478;
  double lon = -71.0466;
  final minuteDataList = <MinuteData>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      var data = await FetchWeatherData().fetchData(lat, lon);
      minuteDataList.assignAll(data);
      print(data);
    } catch (e) {
      print('Error fetching weather data: $e');
    }
  }
}
