import 'package:flutter/material.dart';

class NetworkSucessful extends StatelessWidget {
  const NetworkSucessful({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(0, 99, 84, 1),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 250),
        child: Column(
          children: [
            Center(
              child: Icon(
                Icons.verified_rounded,
                size: 200,
                color: Colors.white,
              ),
            ),
            Text(
              'Network Sucessfully',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.white),
            ),
            Text(
              'Connected',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.white),
            ),
          ],
        ),
      )),
    );
  }
}
