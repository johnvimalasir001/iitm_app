import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/auth/controller/user_data_controller.dart';
import 'package:iitm_app/src/features/weather/controller/weather_controller.dart';

class WeatherCard extends StatefulWidget {
  const WeatherCard({Key? key}) : super(key: key);

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  final WeatherController weatherController = WeatherController();
  final UserDataController userDataController = UserDataController();
  var tmp = 0x00B0;

  @override
  void initState() {
    super.initState();
    userDataController.getUserDetails();
    weatherController.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (weatherController.minuteDataList.isEmpty) {
        weatherController.fetchData();
        return const CircularProgressIndicator(
          backgroundColor: Colors.blue,
        );
      } else {
        return Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 110,
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "தமிழ்நாடு 19-03-2024",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "${weatherController.minuteDataList[0].values.temperature.toString()}°C",
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "ஈரப்பதம் ${weatherController.minuteDataList[0].values.humidity} %",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      "assets/img/cloudy.png",
                      height: 100,
                      width: 100,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                color: Colors.white,
              ),
              const Text(
                "பூச்சிக்கொல்லி மருந்துகளை பயன்படுத்த இன்று நல்ல நாள்",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        );
      }
    });
  }
}
