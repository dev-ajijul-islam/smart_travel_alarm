import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:smart_travel_alearm/app.dart';
import 'package:smart_travel_alearm/core/services/hive_service.dart';
import 'package:smart_travel_alearm/core/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  NotificationService.init();

  final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
      NotificationService.notificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();

  await androidImplementation?.requestNotificationsPermission();
  HiveService.init();
  runApp(SmartTravelAlarm());
}
