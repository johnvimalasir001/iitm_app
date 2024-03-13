import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  RxString phoneNumber = ''.obs;
  RxString otp = ''.obs;

  FirebaseAuth _auth = FirebaseAuth.instance;

  void updatePhoneNumber(String value) {
    phoneNumber.value = value;
  }

  void updateOTP(String value) {
    otp.value = value;
  }

Future<void> verifyOTP(String verificationId,String otp) async {
  try {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );

    await _auth.signInWithCredential(phoneAuthCredential);

    // Navigate to the next screen upon successful authentication
    Get.offNamed('/home');
  } catch (e) {
    // Handle authentication failure
    print('Failed to verify OTP: $e');
    Get.snackbar('Error', 'Failed to verify OTP. Please try again.',
        snackPosition: SnackPosition.BOTTOM);
  }
}


  String _verificationId = '';

  Future<void> sendOTP() async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber.value,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          // Navigate to the next screen upon successful authentication
          Get.offNamed('/home');
        },
        verificationFailed: (FirebaseAuthException e) {
          print('Failed to verify phone number: ${e.message}');
          Get.snackbar('Error', 'Failed to verify phone number: ${e.message}',
              snackPosition: SnackPosition.BOTTOM);
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          Get.snackbar('Success', 'OTP has been sent to ${phoneNumber.value}.',
              snackPosition: SnackPosition.BOTTOM);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
        timeout: Duration(seconds: 60), // Set timeout duration
        forceResendingToken: null, // Provide forceResendingToken if necessary
      );
    } catch (e) {
      print('Failed to send OTP: $e');
      Get.snackbar('Error', 'Failed to send OTP. Please try again.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
   Future <void> resendOTP(String phoneNumber, int? resendToken) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Error: ${e.message}');
      },
      codeSent: (String verificationId, int? newResendToken) {
        // Update resendToken and navigate back to OTP page
        Get.offNamed('/otp', arguments: {'verificationId': verificationId, 'resendToken': newResendToken});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: Duration(seconds: 60), // Change timeout if needed
      forceResendingToken: resendToken,
    );
  }
}
