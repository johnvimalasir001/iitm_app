import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/features/auth/controller/auth_controller.dart';
import 'package:iitm_app/src/features/auth/pages/otppage.dart';
import 'package:iitm_app/src/features/auth/widgets/custom_button.dart';

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    TextEditingController phoneNumberController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context); // Use Navigator.pop to go back
          },
          child: const Icon(
            Icons.arrow_back,
            size: 25,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'உள்நுழைவு',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 8, left: 4),
                  child: Text(
                    'உங்கள் எண்ணை நிரப்பவும்',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                TextField(
                  controller: phoneNumberController,
                  decoration: const InputDecoration(
                    hintText: '  தொலைபேசி எண்',
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomElevatedButton(
                  fieldName: "Get OTP",
                  onPressed: () async {
                    if (phoneNumberController.text.isEmpty) {
                      Get.snackbar(
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

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OTPPage(
                            phonenNumber: phoneNumberController.text,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
