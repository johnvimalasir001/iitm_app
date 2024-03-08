import 'package:flutter/material.dart';
import 'package:iitm_app/view/phonenumber.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 12, top: 10, bottom: 30),
              child: Text(
                'H2O Smart',
                style: TextStyle(
                    fontSize: 22,
                    color: Color.fromRGBO(83, 132, 118, 1),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://th.bing.com/th/id/OIP.7ZDCSqMH3nG447A6fYzksgAAAA?rs=1&pid=ImgDetMain'),
                        fit: BoxFit.fill)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 50),
              child: Center(
                child: Text(
                  'Smart',
                  style: TextStyle(
                      fontSize: 38, fontWeight: FontWeight.w500, height: 1),
                ),
              ),
            ),
            const Center(
              child: Text(
                'Irrigitation',
                style: TextStyle(
                    fontSize: 38, fontWeight: FontWeight.w500, height: 1.2),
              ),
            ),
            const Center(
              child: Text(
                'System',
                style: TextStyle(
                    fontSize: 38, fontWeight: FontWeight.w500, height: 1),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25),
              child: Center(
                  child: Text(
                'A smart wireless sensors network',
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.w500),
              )),
            ),
            const Center(
                child: Text(
              'designed to eliminate water wastage',
              style:
                  TextStyle(color: Colors.black45, fontWeight: FontWeight.w500),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PhoneNumber(),
                      ));
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: const Center(
                    child: Text(
                      'Get started',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
