import 'package:flutter/material.dart';
import 'package:iitm_app/src/features/application_page/pages/application_page.dart';
import 'package:iitm_app/src/features/auth/pages/loginpage.dart';
import 'package:iitm_app/src/features/auth/pages/phonenumber.dart';
import 'package:iitm_app/src/features/auth/widgets/expansion.dart';
import 'package:iitm_app/src/core/routes/app_routes.dart';
import 'package:iitm_app/src/features/home/pages/home.dart';

import 'package:iitm_app/src/features/auth/pages/userdetail.dart';
import 'package:iitm_app/src/features/map/widgets/map.dart';
import 'package:iitm_app/src/features/map/pages/user_location.dart';

class AppRoutes {
  Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder>{
      AppRouteNames.navBarRoute: (context) => const ApplicationPage(),
      AppRouteNames.loginRoute: (context) => const LoginPage(),
      AppRouteNames.homeRoute: (context) => const HomePage(),
      AppRouteNames.userDetailsroute: (context) => const UserDetails(),
      AppRouteNames.phoneNumberRoute: (context) => const PhoneNumber(),
      AppRouteNames.expansionDetails: (context) => MyDropdown(),
      AppRouteNames.mapRoutes: (context) => const MapPage(),
      AppRouteNames.userlocationRoute: (context) => const UserLocationpage(),
    };
  }
}
