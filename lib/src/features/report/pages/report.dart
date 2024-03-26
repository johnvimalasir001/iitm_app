import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iitm_app/src/features/report/pages/taskinput.dart';
import 'package:iitm_app/src/features/report/widgets/reportdata_builder.dart';
import 'package:iitm_app/src/features/report/widgets/taskrecord.dart';

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
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TaskManagement(),
              ));
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
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
                child: const ReportDataBuilder(),
              ),
              Text(
                'இன்றைய டாஸ்க்',
                style: TextStyle(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Slidable(
                  endActionPane:
                      ActionPane(motion: const BehindMotion(), children: [
                    SlidableAction(
                      backgroundColor: Colors.red,
                      label: 'ஆஃப்',
                      onPressed: (context) => _onDismissed,
                    )
                  ]),
                  startActionPane:
                      ActionPane(motion: const ScrollMotion(), children: [
                    SlidableAction(
                      backgroundColor: Colors.green,
                      label: 'ஆன்',
                      onPressed: (context) => _onDismissed,
                    )
                  ]),
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Container(
                      height: 65.h,
                      width: double.infinity.w,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.r))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 2.h, left: 8.w),
                                child: Text(
                                  'டாஸ்க் 1',
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 17.w),
                                child: Text(
                                  'மோட்டாரை ஆன்/ஆஃப் செய்யவும்',
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 17.w),
                                child: Row(
                                  children: [
                                    Text(
                                      '16/3/2024',
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      '10:00 AM',
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
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

  void _onDismissed() {}
}
