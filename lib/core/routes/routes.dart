import 'package:flutter/material.dart';
import 'package:iitm_app/src/auth/pages/loginpage.dart';
import 'package:iitm_app/src/auth/pages/phonenumber.dart';
import 'package:iitm_app/src/auth/widgets/expansion.dart';
import 'package:iitm_app/core/routes/app_routes.dart';
import 'package:iitm_app/src/home/pages/home.dart';

import 'package:iitm_app/src/auth/widgets/userdetail.dart';
import 'package:iitm_app/src/map/pages/map.dart';

class AppRoutes {
  Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder>{
      AppRouteNames.loginRoute: (context) => const LoginPage(),
      AppRouteNames.homeRoute: (context) => const HomePage(),
      AppRouteNames.userDetailsroute: (context) => const UserDetails(),
      AppRouteNames.phoneNumberRoute: (context) => const PhoneNumber(),
      AppRouteNames.expansionDetails: (context) => MyDropdown(),
      AppRouteNames.mapRoutes: (context) => MapPage(),
    };
  }
}
