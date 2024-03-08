import 'package:flutter/material.dart';
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
          child: const Icon(
            Icons.arrow_back,
            size: 25,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Login Page',
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
              //

              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 8, left: 4),
                child: Text(
                  'Enter Your Number',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                    hintText: '  phone number',
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                keyboardType: TextInputType.numberWithOptions(),
              ),
              const SizedBox(
                height: 30,
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
                  height: 70,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Center(
                    child: Text(
                      'Get OTP',
                      style: TextStyle(
                          fontSize: 18,
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
