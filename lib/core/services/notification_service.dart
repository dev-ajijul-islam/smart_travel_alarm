import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static FlutterLocalNotificationsPlugin get notificationsPlugin =>
      _notificationsPlugin;
      
  static void init() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings();

    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notificationsPlugin.initialize(settings: settings);

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'travel_noti',
      'Travel notification',
      description: 'This channel is for travel alarms',
      importance: Importance.max,
    );

    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);

    tz.initializeTimeZones();
  }

  static Future<void> scheduleAlarm(DateTime scheduleTime, int id) async {
    await _notificationsPlugin.zonedSchedule(
      id: id,
      title: "Travel Alarm",
      body: "Time to travel!",
      scheduledDate: tz.TZDateTime.from(scheduleTime, tz.local),
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'travel_noti',
          'Travel notification',
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  static Future<void> cancelAlarm(int id) async {
    try {
      await _notificationsPlugin.cancel(id: id);
    } catch (e) {
      print('Error canceling alarm: $e');
    }
  }
}
