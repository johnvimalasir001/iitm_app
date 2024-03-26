import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/report/widgets/todaytask_record_data.dart';

class TodayTaskRecord extends StatelessWidget {
  const TodayTaskRecord({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: GestureDetector(
          onTap: () {
            Get.to(const TodayTaskRecordData());
          },
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
    );
  }
}
