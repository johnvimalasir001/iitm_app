import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/weather/controller/weather_controller.dart';
import 'package:iitm_app/src/features/weather/models/weather_model.dart';

class WeatherPages extends StatelessWidget {
  final WeatherController weatherController = Get.put(WeatherController());

   WeatherPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Page'),
      ),
      body: Obx(() {
        if (weatherController.minuteDataList.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: weatherController.minuteDataList.length,
            itemBuilder: (context, index) {
              var minuteData = weatherController.minuteDataList[index];
              return ListTile(
                title: Text('Time: ${minuteData.time}'),
                subtitle: Text('Temperature: ${minuteData.values.temperature}'),
              );
            },
          );
        }
      }),
    );
  }
}
