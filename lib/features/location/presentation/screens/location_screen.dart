import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_travel_alearm/common_widgets/button_loading.dart';
import 'package:smart_travel_alearm/constant/app_assets.dart';
import 'package:smart_travel_alearm/constant/app_color.dart';
import '../../controllers/location_controller.dart';
import '../../../../common_widgets/primary_button.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({super.key});

  final LocationController controller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.backgroundTop, AppColors.backgroundBottom],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Text(
                  "Welcome! Your Smart\nTravel Alarm",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Stay on schedule and enjoy every\nmoment of your journey.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    height: 1.5,
                  ),
                ),
                const Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    AppAssets.onboard1,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const Spacer(),
                Obx(
                  () => OutlinedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : controller.getCurrentLocation,
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 56),
                      side: const BorderSide(color: Colors.white30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: controller.isLoading.value
                        ? const ButtonLoading()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Use Current Location",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.location_searching,
                                color: Colors.white,
                                size: 18,
                              ),
                            ],
                          ),
                  ),
                ),
                const SizedBox(height: 16),
                PrimaryButton(
                    text: "Next",
                    onPressed: () {
                      controller.goToAlarmScreen();
                    },
                  ),
                const SizedBox(height: 12),
                Obx(
                  () => Text(
                    controller.locationText.value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
