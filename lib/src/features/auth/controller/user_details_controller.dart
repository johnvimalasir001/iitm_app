import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;

class UserDetailsController extends GetxController {
  String selectedUnit = 'அலகு'; // Initial value for the selected unit
  String cropSelectedName = 'பயிர் பெயர்';

  final RxString firstName = ''.obs;
  final RxString lastName = ''.obs;
  final RxString email = ''.obs;
  final RxString cropName = ''.obs;
  final RxString landSize = '0'.obs;
  final RxString unit = ''.obs;
  final RxString address = ''.obs;
  final RxDouble latitude = 0.0.obs;
  final RxDouble longitude = 0.0.obs;

  void updateSelectedUnit(String item) {
    selectedUnit = item; 
    update(); 
  }

  void updateCropSelectedUnit(String cropName) {
    cropSelectedName = cropName; 
    update(); 
  }

  Future<void> createUserDocument(
    String firstName,
    String lastName,
    String email,
    String cropName,
    String landSize,
    String unit,
    String address,
    double latitude,
    double longitude,
  ) async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        CollectionReference users = firestore.collection('users');

        await users.doc(user.uid).set({
          'firstName': firstName,
          'lastName': lastName,
          'userEmail': email,
          'cropName': cropName,
          'landSize': landSize,
          'unit': unit,
          'address': address,
          'latitdue': latitude,
          'longitude': longitude,
        });
      } else {
        Get.snackbar(
          "Error",
          "User is not authenticated",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Failure",
        "Error creating user document: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
