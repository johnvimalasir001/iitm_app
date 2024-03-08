import 'package:flutter/material.dart';
import 'package:iitm_app/view/loginpage.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'poppins'),
      home: const LoginPage(),
    ));
