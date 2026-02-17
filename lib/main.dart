import 'package:flutter/material.dart';
import 'package:smart_travel_alearm/app.dart';
import 'package:smart_travel_alearm/core/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationService.instance.init();
  runApp(SmartTravelAlarm());
}
