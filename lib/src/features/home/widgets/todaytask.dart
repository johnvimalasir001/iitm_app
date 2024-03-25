import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Todaytask extends StatelessWidget {
  const Todaytask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Today Weather',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          '28°C',
                          style: TextStyle(fontSize: 23, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      'மோட்டார் 1 இயங்குகிறது',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 2.w, top: 5),
                    child: Row(
                      children: [
                        Text(
                          'காலத்தொடர்ச்சி:',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          '10:00 AM - 12:00 PM',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        height: 55.h,
        width: double.infinity.w,
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 17.w, top: 11),
                child: Text(
                  'மோட்டார் 1 இயங்குகிறது',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 17.w, top: 5),
                child: Row(
                  children: [
                    Text(
                      'Duration :',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      '10:00 AM - 12:00 PM',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
