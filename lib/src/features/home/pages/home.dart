
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iitm_app/src/features/home/widgets/todaytask.dart';

import 'package:iitm_app/src/features/home/widgets/custom_text.dart';
import 'package:iitm_app/src/features/home/widgets/home_app_bar_widget.dart';
import 'package:iitm_app/src/features/home/widgets/weather_card.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppBar(),
                const SizedBox(height: 15),
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
                  height: 55.h,
                  width: double.infinity,
                  color: Colors.blue.shade50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text('மோட்டார் சுவிட்ச்',
                            style: TextStyle(fontSize: 18.sp)),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 15.w),
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 32.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.r))),
                                child: Center(
                                  child: Text('ON',
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 32.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.r))),
                                child: Center(
                                  child: Text('OFF',
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                const CustomText(inputText: "இன்றைய டாஸ்க்"),
                const SizedBox(height: 12),
                const Todaytask(),
                const SizedBox(height: 12),
                const Row(
                  children: [
                    CustomText(inputText: "மண் ஈரம்"),
                    Padding(
                      padding: EdgeInsets.only(left: 70),
                      child: CustomText(inputText: "நீர் ஓட்டம்"),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      height: 70.h,
                      width: 105.w,
                      decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.r))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '16%',
                              style: TextStyle(
                                  fontSize: 28.sp, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'மண் ஈரம்',
                              style: TextStyle(
                                fontSize: 11.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Container(
                        height: 70.h,
                        width: 115.w,
                        decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '2',
                                    style: TextStyle(
                                        fontSize: 26.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text(
                                      'L/min',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'நீர் ஓட்டம்',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // ListView.builder(
                //   physics:  NeverScrollableScrollPhysics(),
                //   shrinkWrap: true,
                //   itemCount: 10,
                //   itemBuilder: (BuildContext context, int index) {
                //     return  Padding(
                //       padding: EdgeInsets.symmetric(vertical: 10),
                //       child: RecentActivityCard(),
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
