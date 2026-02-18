import 'package:get/get.dart';
import 'package:smart_travel_alearm/features/alarm/binding/alarm_binding.dart';
import 'package:smart_travel_alearm/features/alarm/presentation/screens/alarm_screen.dart';
import 'package:smart_travel_alearm/features/location/binding/location_binding.dart';
import 'package:smart_travel_alearm/features/onboarding/binding/onboarding_binding.dart';
import '../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../features/location/presentation/screens/location_screen.dart';
import '../constant/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.location,
      page: () => LocationScreen(),
      binding: LocationBinding(),
    ),
    GetPage(
      name: AppRoutes.alarm,
      page: () => AlarmScreen(),
      binding: AlarmBinding(),
    ),
  ];
}
