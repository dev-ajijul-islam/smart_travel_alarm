import 'package:get/get.dart';
import 'package:smart_travel_alearm/features/location/controllers/location_controller.dart';

class LocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocationController());
  }

}