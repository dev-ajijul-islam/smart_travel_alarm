import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:smart_travel_alearm/constant/app_routes.dart';

class LocationController extends GetxController {
  RxString locationText = "No location selected".obs;
  RxBool isLoading = false.obs;

  Future<void> getCurrentLocation() async {
    isLoading.value = true;

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      locationText.value = "Location services are disabled.";
      isLoading.value = false;
      return;
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        locationText.value = "Location permission denied.";
        isLoading.value = false;
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      locationText.value =
          "Permission permanently denied. Please enable from settings.";
      isLoading.value = false;
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: .high),
    );

    locationText.value =
        "Lat: ${position.latitude}, Lng: ${position.longitude}";

    isLoading.value = false;
  }

  void goToAlarmScreen() {
    Get.toNamed(AppRoutes.location);
  }
}
