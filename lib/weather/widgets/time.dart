import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Days extends StatelessWidget {
  const Days({
    super.key,
    required this.time,
  });
  final String time;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 2.w,
        right: 2.w,
      ),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 40.h,
          width: 68.w,
          decoration: BoxDecoration(

              // color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(10.r))),
          child: Center(
            child: Text(
              time,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black45),
            ),
          ),
        ),
      ),
    );
  }
}
