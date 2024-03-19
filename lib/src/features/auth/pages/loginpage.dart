import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iitm_app/src/features/auth/pages/phonenumber.dart';
import 'package:iitm_app/src/features/auth/widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(8.0.h.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 12.w, top: 10.h, bottom: 30.w),
              child: Text(
                'H2O Smart',
                style: TextStyle(
                    fontSize: 22.sp,
                    color: const Color.fromRGBO(83, 132, 118, 1),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: Container(
                height: 190.h,
                width: double.infinity.w,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://th.bing.com/th/id/OIP.7ZDCSqMH3nG447A6fYzksgAAAA?rs=1&pid=ImgDetMain'),
                        fit: BoxFit.fill)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 38.h),
              child: Center(
                child: Text(
                  'நவீன',
                  style: TextStyle(
                      fontSize: 38.sp,
                      fontWeight: FontWeight.w500,
                      height: 1.h),
                ),
              ),
            ),
            Center(
              child: Text(
                'நீர்ப்பாசன',
                style: TextStyle(
                    fontSize: 38.sp, fontWeight: FontWeight.w500, height: 1.h),
              ),
            ),
            Center(
              child: Text(
                'அமைப்பு',
                style: TextStyle(
                    fontSize: 38.sp, fontWeight: FontWeight.w500, height: 1.h),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: const Center(
                  child: Text(
                'ஸ்மார்ட் வயர்லெஸ் சென்சார்கள் நெட்வொர்க்',
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500),
              )),
            ),
            const Center(
                child: Text(
              'நீர் விரயத்தை அகற்ற வடிவமைக்கப்பட்டுள்ளது',
              style:
                  TextStyle(color: Colors.black45, fontWeight: FontWeight.w500),
            )),
            Padding(
              padding: EdgeInsets.only(top: 30.h),
              child: CustomElevatedButton(
                fieldName: "Get Started",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PhoneNumber(),
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PhoneNumber(),
                      ));
                },
                child: Container(
                  height: 55.h,
                  width: double.infinity.w,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(8.r))),
                  child: Center(
                    child: Text(
                      'தொடங்கு',
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
