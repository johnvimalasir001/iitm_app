import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iitm_app/src/features/home/controller/switch_controller.dart';
import 'package:iitm_app/src/features/home/widgets/field_waterflow_container.dart';
import 'package:iitm_app/src/features/home/widgets/home_soilmoisure_container.dart';
import 'package:iitm_app/src/features/home/widgets/todaytask.dart';

import 'package:iitm_app/src/features/home/widgets/custom_text.dart';
import 'package:iitm_app/src/features/home/widgets/home_app_bar_widget.dart';
import 'package:iitm_app/src/features/home/widgets/waterflow_container.dart';
import 'package:iitm_app/src/features/home/widgets/weather_card.dart';
import 'package:iitm_app/src/features/report/controller/report_controller.dart';
import 'package:iitm_app/src/features/weather/pages/weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> fieldName = ['வானிலை', 'நீரோட்டம்', 'வெப்பநிலை', 'ஈரப்பதம்'];
  List<String> imgPath = [
    "assets/img/cloudy.png",
    "assets/img/cloudy.png",
    "assets/img/cloudy.png",
    "assets/img/cloudy.png",
  ];

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    bool light = false;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppBar(),
                const SizedBox(height: 13),
                const CustomText(inputText: "இன்றைய வானிலை"),
                const SizedBox(height: 15),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  WeatherPage(),
                          ));
                    },
                    child:  WeatherCard()),
                const SizedBox(height: 15),
                Container(
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text('மோட்டார் சுவிட்ச்',
                            style: TextStyle(fontSize: 17.sp)),
                      ),
                      Obx(() {
                        return Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Switch(
                            value: homeController.switchbutton.value,
                            activeColor: Colors.green.shade600,
                            inactiveTrackColor: Colors.red,
                            thumbColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (states) => Colors.white,
                            ),
                            onChanged: (bool value) {
                              homeController.switchbutton.value = value;
                            },
                          ),
                        );
                      })
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const CustomText(inputText: "இன்றைய டாஸ்க்"),
                const SizedBox(height: 12),
                const Todaytask(
                  title: 'மோட்டார் 1 இயங்குகிறது',
                  time: '10:00 AM - 12:00 PM',
                ),
                const SizedBox(
                  height: 10,
                ),
                const Todaytask(
                  title: 'மோட்டர் 2 இயங்கும்',
                  time: '4:00 PM - 6:00 PM',
                ),
                const SizedBox(height: 10),
                //
                const CustomText(inputText: "அறிக்கை"),
                //
                const SizedBox(height: 8),
                const Row(
                  children: [
                    HomeSoilMoisureContainer(),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: WaterflowContainer(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: FieldWaterflowContainer(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
