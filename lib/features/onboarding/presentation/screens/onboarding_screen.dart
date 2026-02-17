import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_travel_alearm/constant/app_color.dart';
import '../../controllers/onboarding_controller.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/onboarding_indicator.dart';
import '../../../../common_widgets/primary_button.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBottom,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView(
                  controller: controller.pageController,
                  onPageChanged: controller.onPageChanged,
                  children: const [
                    OnboardingPage(
                      image: "assets/images/onboard1.png",
                      title: "Discover the world, one journey at a time.",
                      subtitle: "From hidden gems to iconic destinations, we make travel simple, inspiring, and unforgettable. Start your next adventure today.",
                    ),
                    OnboardingPage(
                      image: "assets/images/onboard2.png",
                      title: "Explore new horizons, one step at a time.",
                      subtitle: "Every trip holds a story waiting to be lived. Let us guide you to experience their charms, connect, and last a lifetime.",
                    ),
                    OnboardingPage(
                      image: "assets/images/onboard3.png",
                      title: "See the beauty, one journey at a time.",
                      subtitle: "Travel made simple and exciting—discover places you’ll love and moments you’ll never forget.",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 50,),
              Obx(() => OnboardingIndicator(
                    currentIndex: controller.currentIndex.value,
                  )),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Obx(() => PrimaryButton(
                      text: controller.currentIndex.value == 2 ? "Get Started" : "Next",
                      onPressed: controller.nextPage,
                    )),
              ),

              const SizedBox(height: 20), 
            ],
          ),

       
          Positioned(
            top: 50, 
            right: 20,
            child: TextButton(
              onPressed: controller.skip,
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}