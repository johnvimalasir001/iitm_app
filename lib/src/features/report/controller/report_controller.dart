import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;

class ReportController extends GetxController {
  final Rx<Color?> buttonColor = Colors.blue.obs;

  final RxString taskTitle = "".obs;
  final RxString taskActivity = "".obs;
  final RxString date = "".obs;
  final RxString time = "".obs;
  final RxBool remaindMe = false.obs;
  final RxString description = "".obs;

  Future<void> createNewTask(
    String taskTitle,
    String taskActivity,
    String date,
    String time,
    bool remaindMe,
    String description,
  ) async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        CollectionReference users = firestore.collection('tasks');

        await users.doc(user.uid).set({
          'taskTitle ': taskTitle,
          'taskActivity': taskActivity,
          'date': date,
          'time': time,
          'remaindMe': remaindMe,
          'description': description,
        });
      } else {
        Get.snackbar(
          "Error",
          "Unable to create New Task",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Failure",
        "Error creating New Task: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
