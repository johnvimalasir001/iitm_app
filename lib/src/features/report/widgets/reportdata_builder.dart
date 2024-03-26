import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/report/widgets/report_data.dart';
import 'package:iitm_app/src/features/weather/controller/weather_controller.dart';

class ReportDataBuilder extends StatelessWidget {
   ReportDataBuilder({Key? key}) : super(key: key);

  final WeatherController weatherController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      width: double.infinity.w,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          String? temp = weatherController.minuteDataList.isNotEmpty
              ? weatherController.minuteDataList[0].values.temperature
                  .toString()
              : '35.8';
          String? soil = weatherController.minuteDataList.isNotEmpty
              ? weatherController.minuteDataList[0].values.temperature
                  .toString()
              : '10';
          String? hum = weatherController.minuteDataList.isNotEmpty
              ? weatherController.minuteDataList[0].values.humidity.toString()
              : '75';

          final List<String> dailyreport = [temp, soil, hum];

          final List<String> dailyreportcontent = [
            'வெப்ப நிலை',
            'மண் ஈரம்',
            'ஈரம்'
          ];

          final List reportcolor = [
            Colors.orange.shade100,
            Colors.green.shade100,
            Colors.blue.shade100
          ];

          return ReportData(
            dailyreport: dailyreport[index],
            dailyreportcontent: dailyreportcontent[index],
            reportcolor: reportcolor[index],
          );
        },
      ),
    );
  }
}
