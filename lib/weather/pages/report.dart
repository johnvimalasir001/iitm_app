import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iitm_app/weather/widgets/reportdata_builder.dart';

class Report extends StatelessWidget {
  Report({super.key});

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
          'Report',
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w600),
        ),
        elevation: 1,
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
                'Today task',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Container(
                  height: 65.h,
                  width: double.infinity.w,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.all(Radius.circular(10.r))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 2.h, left: 8.w),
                            child: Text(
                              'Task 1',
                              style: TextStyle(
                                  fontSize: 17.sp, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 17.w),
                            child: Text(
                              'Turn ON/OFF the motor',
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 17.w),
                            child: Row(
                              children: [
                                Text(
                                  '16/3/2024',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  '10:00 AM',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 18.w),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 33.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                    color: Colors.blue.shade400,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.r))),
                                child: Center(
                                  child: Text(
                                    'ON',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 33.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                    color: Colors.blue.shade400,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.r))),
                                child: Center(
                                  child: Text(
                                    'OFF',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Task Record',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5.h,
              ),
              ListView.builder(
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

class TaskRecord extends StatelessWidget {
  const TaskRecord({
    super.key,
    required this.recorddate,
  });
  final String recorddate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Container(
        height: 55.h,
        width: double.infinity.w,
        decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.all(Radius.circular(10.r))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 14.w, top: 7.h),
                  child: Text(
                    'Turn ON/OFF the motor',
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 14.w,
                  ),
                  child: Row(
                    children: [
                      Text(
                        recorddate,
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        '10:00 - 12:00',
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.circle,
              ),
              color: Colors.green,
            ),
            // Container(
            //   height: 40,
            //   width: 40,
            //   decoration: BoxDecoration(
            //       color: Colors.green, borderRadius: BorderRadius.circular(30)),
            //   child:
            // )
          ],
        ),
      ),
    );
  }
}
