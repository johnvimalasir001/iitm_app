import 'package:flutter/material.dart';
import 'package:iitm_app/view/phonenumber.dart';
import 'package:iitm_app/view/userdetail.dart';
import 'package:pinput/pinput.dart';

class OTPPage extends StatelessWidget {
  const OTPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PhoneNumber(),
                ));
          },
          child: const Icon(
            Icons.arrow_back,
            size: 25,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Verify OTP',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'Enter the 6-Digit Key in your message',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
              child: Pinput(
                length: 6,
                showCursor: true,
                defaultPinTheme: PinTheme(
                  width: 80,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black38,
                    ),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserDetails(),
                    ));
              },
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Center(
                  child: Text(
                    'Verify',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),

            //
          ],
        ),
      ),
    );
  }
}
