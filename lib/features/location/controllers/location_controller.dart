import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../../../constant/app_routes.dart';

class LocationController extends GetxController {

  RxString locationText = "Checking location permission...".obs;
  RxBool isLoading = false.obs;
  RxBool hasLocation = false.obs;
  RxBool isPermissionGranted = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkPermission();
  }


  Future<void> checkPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      locationText.value = "Location services are disabled.";
      isPermissionGranted.value = false;
      hasLocation.value = false;
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      locationText.value = "Location permission required.";
      isPermissionGranted.value = false;
      hasLocation.value = false;
      return;
    }

    isPermissionGranted.value = true;
    locationText.value = "Permission granted. Tap to get location.";
    getCurrentLocation();
  }


  Future<void> getCurrentLocation() async {
    isLoading.value = true;
    if (!isPermissionGranted.value) {
      await checkPermission();
      isLoading.value = false;
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      await _convertLatLngToAddress(
        position.latitude,
        position.longitude,
      );

      hasLocation.value = true;

    } catch (e) {
      locationText.value = "Failed to get location.";
      hasLocation.value = false;
    }

    isLoading.value = false;
  }

  Future<void> _convertLatLngToAddress(
    double latitude,
    double longitude,
  ) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;

        locationText.value =
            "${place.street ?? ''}, "
            "${place.locality ?? ''}, "
            "${place.country ?? ''}";
      } else {
        locationText.value = "Address not found.";
      }

    } catch (e) {
      locationText.value = "Failed to fetch address.";
    }
  }


  void goToAlarmScreen() {
    if (hasLocation.value) {
      Get.toNamed(AppRoutes.alarm);
    }
  }
}
