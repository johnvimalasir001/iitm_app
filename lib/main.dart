import 'package:flutter/material.dart';
import 'package:iitm_app/src/core/dependency/injection.dart';
import 'package:iitm_app/src/re_name.dart';

void main() async {
  // Dependency initialization
  await DependencyInjection.initialise();

  //
  runApp(const RootApp());
}
