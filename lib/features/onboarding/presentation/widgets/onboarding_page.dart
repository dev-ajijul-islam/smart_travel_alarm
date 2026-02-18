import 'package:flutter/material.dart';
import 'package:smart_travel_alearm/constant/app_color.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(image, height: 430, width: .infinity, fit: .fill),
        Padding(
          padding: .symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 16, color: AppColors.white70),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
