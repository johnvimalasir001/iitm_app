import 'package:flutter/material.dart';
import 'package:iitm_app/auth/loginpage.dart';
import 'package:iitm_app/auth/phonenumber.dart';
import 'package:iitm_app/auth/widgets/expansion.dart';
import 'package:iitm_app/core/routes/app_routes.dart';
import 'package:iitm_app/home/home.dart';

import 'package:iitm_app/auth/widgets/userdetail.dart';
import 'package:iitm_app/weather/pages/report.dart';

class AppRoutes {
  Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder>{
      AppRouteNames.loginRoute: (context) => const LoginPage(),
      AppRouteNames.homeRoute: (context) => const HomePage(),
      AppRouteNames.userDetailsroute: (context) => const UserDetails(),
      AppRouteNames.phoneNumberRoute: (context) => const PhoneNumber(),
      AppRouteNames.expansionDetails: (context) => const MyDropdown(),
      AppRouteNames.reportroute: (context) => const Report(),
    };
  }
}
