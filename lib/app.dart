import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_travel_alearm/features/onboarding/presentation/screens/onboarding_screen.dart';

class SmartTravelAlarm extends StatelessWidget {
  const SmartTravelAlarm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}