import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/auth/controller/auth_controller.dart';
import 'package:iitm_app/src/features/auth/presentation/pages/otp_page.dart';
import 'package:iitm_app/src/features/auth/presentation/widgets/custom_button.dart';

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    //
    final AuthController authController = Get.find();
    TextEditingController phoneNumberController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'உள்நுழைவு',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
        ),
      ),

      //
      body: SafeArea(
        child: Column(
          //
          children: [
            //
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
              child: const Text(
                'உங்கள் எண்ணை நிரப்பவும்',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),

            //
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
              child: TextField(
                controller: phoneNumberController,
                decoration: InputDecoration(
                  hintText: 'தொலைபேசி எண்',
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: Colors.blue,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  ),
                ),
                keyboardType: const TextInputType.numberWithOptions(),
              ),
            ),

            //
            const Spacer(),

            //
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: CustomElevatedButton(
                fieldName: "Get OTP",
                onPressed: () async {
                  if (phoneNumberController.text.isEmpty) {
                    Get.snackbar(
                      margin:
                          EdgeInsets.symmetric(vertical: 15.h, horizontal: 8.w),
                      "Error",
                      "Please enter phone number to Login",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  } else {
                    String phoneNumber = '+91${phoneNumberController.text}';
                    authController.updatePhoneNumber(phoneNumber);
                    await authController.sendOTP(); // Updated to sendOTP

                    if (context.mounted) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OTPPage(
                            phonenNumber: phoneNumberController.text,
                          ),
                        ),
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
