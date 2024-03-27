import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSoilMoisureContainer extends StatelessWidget {
  const HomeSoilMoisureContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78.h,
      width: 100.w,
      decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.all(Radius.circular(10.r))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '16%',
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                'மண் ஈரம்',
                style: TextStyle(
                  fontSize: 13.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
