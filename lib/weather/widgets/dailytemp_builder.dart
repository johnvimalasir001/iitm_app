import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iitm_app/weather/widgets/dailytemp_details.dart';

class DailytempBuilder extends StatefulWidget {
  const DailytempBuilder({super.key});

  @override
  State<DailytempBuilder> createState() => _DailytempBuilderState();
}

class _DailytempBuilderState extends State<DailytempBuilder> {
  final List<String> dailytempreport = ['16°', '20°', '30°'];

  final List<String> tempreportcontent = [
    'Avg Temperature',
    'Lowest',
    'highest'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76.h,
      width: double.infinity.w,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return DailyTempDetails(
              dailytempreport: dailytempreport[index],
              tempreportcontent: tempreportcontent[index]);
        },
      ),
    );
  }
}
