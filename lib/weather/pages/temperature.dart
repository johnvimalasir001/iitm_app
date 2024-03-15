import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iitm_app/weather/widgets/dailytemp_builder.dart';
import 'package:iitm_app/weather/widgets/temp_graph.dart';
import 'package:iitm_app/weather/widgets/time_builder.dart';

class Temperature extends StatefulWidget {
  const Temperature({super.key});

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  var tmp = 0x00B0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: const TimeBuilder(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 23.w),
            child: Text(
              "16°",
              style: TextStyle(
                  fontSize: 48.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.orange),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 23.w),
            child: const Text(
              "Current Temperature",
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
            ),
          ),
          const Graph(),
          Padding(
            padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
            child: const DailytempBuilder(),
          )
        ],
      ),
    );
  }
}
