import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_travel_alearm/constant/app_color.dart';
import 'package:smart_travel_alearm/features/alarm/data/model/alarm_model.dart';
import 'package:smart_travel_alearm/features/location/controllers/location_controller.dart';
import '../../controllers/alarm_controller.dart';

class AlarmScreen extends StatelessWidget {
  AlarmScreen({super.key});

  final controller = Get.find<AlarmController>();
  final locationController = Get.find<LocationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTimePicker(context),
        backgroundColor: AppColors.primary,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: AppColors.white70, size: 30),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.backgroundTop,AppColors.backgroundBottom],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Selected Location",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 54,
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(800),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.white54,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        locationController.locationText.value,
                        style: TextStyle(
                          overflow: .ellipsis,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),
                const Text(
                  "Alarms",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                Expanded(
                  child: Obx(() {
                    if (controller.alarmList.isEmpty) {
                      return const Center(
                        child: Text(
                          "No alarms set",
                          style: TextStyle(color: Colors.white54),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: controller.alarmList.length,
                      itemBuilder: (context, index) {
                        final alarm = controller.alarmList[index];
                        return _buildAlarmTile(alarm);
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAlarmTile(AlarmModel alarm) {
    String formattedTime = DateFormat(
      'h:mm a',
    ).format(alarm.time).toLowerCase();
    String formattedDate = DateFormat('EEE d MMM yyyy').format(alarm.time);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(40),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                formattedTime,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                formattedDate,
                style: const TextStyle(color: AppColors.white70, fontSize: 14),
              ),
            ],
          ),

          Switch(
            value: alarm.isEnabled,
            onChanged: (val) => {controller.toggleAlarm(alarm.id, val)},
            activeThumbColor: AppColors.white,
            activeTrackColor: AppColors.primary,
            inactiveThumbColor: AppColors.primary ,
            inactiveTrackColor: AppColors.white,
          ),
        ],
      ),
    );
  }

  Future<void> _showTimePicker(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      final now = DateTime.now();
      var selectedTime = DateTime(
        now.year,
        now.month,
        now.day,
        picked.hour,
        picked.minute,
      );

      if (selectedTime.isBefore(now)) {
        selectedTime = selectedTime.add(const Duration(days: 1));
      }

      controller.addAlarm(selectedTime);
    }
  }
}
