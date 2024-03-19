import 'package:flutter/material.dart';
import 'package:iitm_app/src/core/routes/app_routes.dart';
import 'package:iitm_app/src/features/auth/pages/loginpage.dart';
import 'package:iitm_app/src/features/auth/pages/phonenumber.dart';
import 'package:iitm_app/src/features/auth/widgets/expansion.dart';
import 'package:iitm_app/src/features/auth/widgets/userdetail.dart';
import 'package:iitm_app/src/features/home/pages/home.dart';
import 'package:iitm_app/src/features/weather/pages/report.dart';


class AppRoutes {
  Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder>{
      AppRouteNames.loginRoute: (context) => const LoginPage(),
      AppRouteNames.homeRoute: (context) => const HomePage(),
      AppRouteNames.userDetailsroute: (context) => const UserDetails(),
      AppRouteNames.phoneNumberRoute: (context) => const PhoneNumber(),
      AppRouteNames.expansionDetails: (context) =>  MyDropdown(),
      AppRouteNames.reportroute: (context) => Report(),
    };
  }
}
