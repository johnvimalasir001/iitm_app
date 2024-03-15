import 'package:flutter/material.dart';
import 'package:iitm_app/src/weather/widgets/dailytemp_details.dart';

class DailytempBuilder extends StatelessWidget {
  const DailytempBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      width: double.infinity,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return const DailyTempDetails();
        },
      ),
    );
  }
}
