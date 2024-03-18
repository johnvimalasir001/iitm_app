import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserdetailsComponent extends StatelessWidget {
  const UserdetailsComponent(
      {super.key,
      required this.names,
      required this.icons,
      required this.hintText});

  final String names, hintText;
  final IconData icons;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Text(
            names,
            style: TextStyle(fontSize: 20.sp),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: TextField(
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: Icon(
                icons,
                color: Colors.blue,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
