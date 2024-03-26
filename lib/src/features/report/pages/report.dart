import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/report/controller/report_controller.dart';

import 'package:iitm_app/src/features/report/pages/taskinput.dart';
import 'package:iitm_app/src/features/report/widgets/reportdata_builder.dart';
import 'package:iitm_app/src/features/report/widgets/taskrecord.dart';
import 'package:iitm_app/src/features/report/widgets/today_task_container.dart';

class ReportPage extends StatelessWidget {
  ReportPage({super.key});

  final List<String> recorddate = [
    '16/3/2024',
    '17/3/2024',
    '18/3/2024',
    '19/3/2024',
    '20/3/2024',
    '21/3/2024',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'அறிக்கை',
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TaskManagement(),
              ));
        },
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: ReportDataBuilder(),
              ),
              Text(
                'இன்றைய டாஸ்க்',
                style: TextStyle(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              const TodayTaskContainer(
                  taskTitle: 'டாஸ்க் 1',
                  taskActivity: 'மோட்டாரை ஆன்/ஆஃப் செய்யவும்',
                  date: "20-03-2024",
                  time: "12:30 pm"),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'பணி பதிவு',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5.h,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return TaskRecord(recorddate: recorddate[index]);
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}
