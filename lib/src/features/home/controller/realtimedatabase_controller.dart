import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class RealtimeDataController extends GetxController {
  final _database = FirebaseDatabase.instance.ref();

  RxString data = ''.obs;

  @override
  void onInit() {
    super.onInit();

    fetchData();
  }

  void fetchData() {
    try {
      DatabaseReference dataRef = _database.child('Motor_Controller');

      dataRef.onValue.listen((event) {
        var snapshot = event.snapshot;
        var value = snapshot.value;

        data.value = value.toString();
      });
    } catch (e) {
      log("Error on realtime data fetch $e");
    }
  }

  void updateData(String newData) {
    DatabaseReference dataRef = _database.child('Motor_Controller');

    dataRef.set(newData);
  }
}
