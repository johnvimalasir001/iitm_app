// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBlkuDtxJApJWUNSn1ubvksIx5Qg5SUy6g',
    appId: '1:905182502126:web:f01d01860899ff257de7ff',
    messagingSenderId: '905182502126',
    projectId: 'iot-smart-water-meter',
    authDomain: 'iot-smart-water-meter.firebaseapp.com',
    storageBucket: 'iot-smart-water-meter.appspot.com',
    measurementId: 'G-PKPPP9XYC5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyChObI1WWvAIJGSYIVICgWCnQCvGgP0u7E',
    appId: '1:905182502126:android:53b7b27f07744d3d7de7ff',
    messagingSenderId: '905182502126',
    projectId: 'iot-smart-water-meter',
    storageBucket: 'iot-smart-water-meter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD8Sa3thFsdLxGJuimaBJ-9s5tsdqNEKJs',
    appId: '1:905182502126:ios:6245889d139ffe657de7ff',
    messagingSenderId: '905182502126',
    projectId: 'iot-smart-water-meter',
    storageBucket: 'iot-smart-water-meter.appspot.com',
    iosBundleId: 'com.example.iitmApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD8Sa3thFsdLxGJuimaBJ-9s5tsdqNEKJs',
    appId: '1:905182502126:ios:d774aef1b8c28a757de7ff',
    messagingSenderId: '905182502126',
    projectId: 'iot-smart-water-meter',
    storageBucket: 'iot-smart-water-meter.appspot.com',
    iosBundleId: 'com.example.iitmApp.RunnerTests',
  );
}