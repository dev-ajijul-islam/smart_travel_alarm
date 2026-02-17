import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_travel_alearm/constant/app_routes.dart';
import 'package:smart_travel_alearm/routes/app_pages.dart';

class SmartTravelAlarm extends StatelessWidget {
  const SmartTravelAlarm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onboarding,
      getPages: AppPages.routes,
    );
  }
}
