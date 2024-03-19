import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


final FirebaseFirestore firestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;

class UserDetailsController extends GetxController {
  String selectedUnit = 'Unit'; // Initial value for the selected unit
  String cropSelectedName = 'Crop Name';

  final RxString firstName = ''.obs;
  final RxString lastName = ''.obs;
  final RxString email = ''.obs;
  final RxString cropName = ''.obs;
  final RxString landSize = '0'.obs;
  final RxString unit = ''.obs;

  void updateSelectedUnit(String item) {
    selectedUnit = item; // Update the selected unit
    update(); // Update the UI
  }

  void updateCropSelectedUnit(String cropName) {
    cropSelectedName = cropName; // Update the selected unit
    update(); // Update the UI
  }

  Future<void> createUserDocument(
    String firstName,
    String lastName,
    String email,
    String cropName,
    String landSize,
    String unit,
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
          'isLocationSelected': false,
        });
        print('User document created successfully');
      } else {
        print('User is not authenticated');
      }
    } catch (e) {
      print('Error creating user document: $e');
    }
  }
}
