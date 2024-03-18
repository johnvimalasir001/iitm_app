import 'package:flutter/material.dart';
import 'package:iitm_app/src/features/weather/widgets/dailytemp_builder.dart';
import 'package:iitm_app/src/features/weather/widgets/graph.dart';
import 'package:iitm_app/src/features/weather/widgets/time_builder.dart';

class Temperature extends StatefulWidget {
  const Temperature({super.key});

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  var tmp = 0x00B0;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amber,
      // backgroundColor: Colors.amber,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TimeBuilder(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 23),
            child: Text(
              "16°",
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 23),
            child: Text(
              "Current Temperature",
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Graph(),
          Padding(
            padding: EdgeInsets.only(top: 40, left: 10, right: 10),
            child: DailytempBuilder(),
          )
        ],
      ),
    );
  }
}
