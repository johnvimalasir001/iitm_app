import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Todaytask extends StatelessWidget {
  const Todaytask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      width: double.infinity.w,
      decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding: EdgeInsets.only(top: 2.h, left: 8.w),
                //   child: Text(
                //     'டாஸ்க் 1',
                //     style: TextStyle(
                //         fontSize: 17.sp,
                //         fontWeight: FontWeight.w500,
                //         color: Colors.black87),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(left: 17.w, top: 11),
                  child: Text(
                    'மோட்டார் 1 இயங்குகிறது',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 17.w),
                  child: Row(
                    children: [
                      Text(
                        'Duration :',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        '10:00 AM - 12:00 PM',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
