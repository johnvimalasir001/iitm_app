import 'package:get/get.dart';
import 'package:iitm_app/src/features/home/controller/realtimedatabase_controller.dart';

class HomeController extends GetxController {
  final RealtimeDataController realtimeDataController = Get.find();

  RxBool switchButton = false.obs;

  @override
  void onInit() {
    super.onInit();
    ever(realtimeDataController.data, (value) {
      switchButton.value = value == 1.toString();
    });
  }

  void toggleSwitch(bool value) {
    
    realtimeDataController.updateData(value ? 1 : 0);
  }
}
