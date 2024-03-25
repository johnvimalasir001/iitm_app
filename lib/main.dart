import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iitm_app/src/core/routes/app_routes.dart';
import 'package:iitm_app/src/core/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB7lm8XR3JabplK1JMX7tQQWBOYuO6WONo",
      appId: "1:964382089415:android:93b1baf37d17d4cde2dee2",
      messagingSenderId: "964382089415",
      projectId: "iot-smart-water-meter-19f34",
    ),
  );
  final AppRoutes appRoutes = AppRoutes();
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          routes: appRoutes.getRoutes(),
          initialRoute: AppRouteNames.navBarRoute,
        );
      },
    ),
  );
}
