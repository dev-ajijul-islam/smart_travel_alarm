import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smart_travel_alearm/constant/app_color.dart';
import 'package:smart_travel_alearm/constant/app_routes.dart';
import 'package:smart_travel_alearm/routes/app_pages.dart';

class SmartTravelAlarm extends StatelessWidget {
  const SmartTravelAlarm({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: GetMaterialApp(
        theme: ThemeData(
            colorSchemeSeed: AppColors.primary
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.onboarding,
        getPages: AppPages.routes,

      ),
    );

  }
}
