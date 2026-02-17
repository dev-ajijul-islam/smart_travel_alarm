import 'package:get/get.dart';
import '../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../features/location/presentation/screens/location_screen.dart';
import '../constant/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingScreen(),
    ),
    GetPage(
      name: AppRoutes.location,
      page: () => LocationScreen(),
    ),

  ];
}
