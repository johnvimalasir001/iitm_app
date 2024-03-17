import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iitm_app/auth/otppage.dart';
import 'package:iitm_app/home/home.dart';
import 'package:iitm_app/auth/widgets/userdetail.dart';

class AuthController extends GetxController {
  RxString phoneNumber = ''.obs;
  RxString otp = ''.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updatePhoneNumber(String value) {
    phoneNumber.value = value;
  }

  void updateOTP(String value) {
    otp.value = value;
  }

  String get verificationId => _verificationId;

  Future<void> verifyOTP(String otp) async {
    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      // Sign in with the credential
      UserCredential userCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      // Check if the user already exists
      if (userCredential.additionalUserInfo!.isNewUser) {
        // Navigate to user details filling page
        Get.to(const UserDetails());
      } else {
        // User already exists, navigate to home page
        Get.to(const HomePage());
      }

      Get.snackbar('Success', 'OTP verification is Successful.',
          snackPosition: SnackPosition.BOTTOM);
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
          // // Navigate to the next screen upon successful authentication
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
        timeout: const Duration(seconds: 100), // Set timeout duration
        forceResendingToken: null, // Provide forceResendingToken if necessary
      );
    } catch (e) {
      print('Failed to send OTP: $e');
      Get.snackbar('Error', 'Failed to send OTP. Please try again.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> resendOTP(String phoneNumber, int? resendToken) async {
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
        Get.to(OTPPage(phonenNumber: phoneNumber), arguments: {
          'verificationId': verificationId,
          'resendToken': newResendToken
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 100), // Change timeout if needed
      forceResendingToken: resendToken,
    );
  }
}
