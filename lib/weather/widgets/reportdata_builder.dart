import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iitm_app/weather/widgets/report_data.dart';

class ReportDataBuilder extends StatefulWidget {
  const ReportDataBuilder({super.key});

  @override
  State<ReportDataBuilder> createState() => _ReportDataBuilderState();
}

class _ReportDataBuilderState extends State<ReportDataBuilder> {
  final List<String> dailyreport = [
    '16°',
    '20°',
    '30°',
  ];

  final List<String> dailyreportcontent = [
    'Temperature',
    'Soil Moisure',
    'Humidity'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76.h,
      width: double.infinity.w,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ReportData(
              dailyreport: dailyreport[index],
              dailyreportcontent: dailyreportcontent[index]);
        },
      ),
    );
  }
}
