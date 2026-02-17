import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../constant/app_assets.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();

  RxInt currentIndex = 0.obs;

  List<Map<String, dynamic>> onBoardinList = [
    {
      "title": "Discover the world, one journey at a time.",
      "subtitle":
          "From hidden gems to iconic destinations, we make travel simple, inspiring, and unforgettable. Start your next adventure today.",
      "image": AppAssets.onboard1,
    },
    {
      "title": "Explore new horizons, one step at a time.",
      "subtitle":
          "Every trip holds a story waiting to be lived. Let us guide you to experience their charms, connect, and last a lifetime.",
      "image": AppAssets.onboard2,
    },
    {
      "title": "See the beauty, one journey at a time.",
      "subtitle":
          "Travel made simple and exciting—discover places you’ll love and moments you’ll never forget.",
      "image": AppAssets.onboard3,
    },
  ];

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void nextPage() {
    if (currentIndex.value < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      goToLocation();
    }
  }

  void skip() {
    goToLocation();
  }

  void goToLocation() {
    Get.offAllNamed('/location');
  }
}
