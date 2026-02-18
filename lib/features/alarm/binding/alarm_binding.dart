import 'package:get/get.dart';
import 'package:smart_travel_alearm/features/alarm/controllers/alarm_controller.dart';

class AlarmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AlarmController());
  }

}