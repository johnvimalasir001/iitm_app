import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iitm_app/src/core/routes/app_routes.dart';
import 'package:iitm_app/src/features/auth/presentation/pages/mobile_number.dart';
import 'package:iitm_app/src/features/auth/presentation/widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: Container(
                  height: 280.h,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://th.bing.com/th/id/OIP.7ZDCSqMH3nG447A6fYzksgAAAA?rs=1&pid=ImgDetMain'),
                        fit: BoxFit.fill),
                  ),
                ),
              ),

              //
              Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: Text(
                  'நவீன நீர்ப்பாசன அமைப்பு',
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: const Text(
                  'நீரின்றி அமையாது உலகெனின் யார்யார்க்கும் வான்இன்று அமையாது ஒழுக்கு',
                  style: TextStyle(
                      color: Colors.black45, fontWeight: FontWeight.w500),
                ),
              ),

              //
              Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: CustomElevatedButton(
                  fieldName: "தொடங்கு",
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRouteNames.phoneNumberRoute,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
