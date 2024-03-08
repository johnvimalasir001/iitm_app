import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iitm_app/view/loginpage.dart';
import 'package:iitm_app/view/otppage.dart';

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ));
          },
          child: Icon(
            Icons.arrow_back,
            size: 25.h,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Login Page',
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //

              Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 8.h, left: 4.w),
                child: Text(
                  'Enter Your Number',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: '  phone number',
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.r)))),
                keyboardType: const TextInputType.numberWithOptions(),
              ),
              SizedBox(
                height: 30.h,
              ),
              //
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OTPPage(),
                      ));
                },
                child: Container(
                  height: 70.h,
                  width: double.infinity.w,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10.r))),
                  child: Center(
                    child: Text(
                      'Get OTP',
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
