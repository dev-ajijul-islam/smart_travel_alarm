import 'package:get/get.dart';
import '../data/model/alarm_model.dart';
import '../../../core/services/notification_service.dart';
import '../../../core/services/hive_service.dart';

class AlarmController extends GetxController {
  RxList<AlarmModel> alarmList = <AlarmModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadAlarms();
  }

  void loadAlarms() {
    alarmList.assignAll(HiveService.getAlarms());
  }

  Future<void> addAlarm(DateTime selectedTime) async {
    final newAlarm = AlarmModel(
      id: DateTime.now().millisecondsSinceEpoch % 1000000,
      time: selectedTime,
      isEnabled: true,
    );

    await NotificationService.scheduleAlarm(selectedTime, newAlarm.id);
    await HiveService.addAlarm(newAlarm);
    alarmList.add(newAlarm);
  }

Future<void> toggleAlarm(int id, bool value) async {
  final index = alarmList.indexWhere((alarm) => alarm.id == id);
  if (index != -1) {
    alarmList[index].isEnabled = value;

    if (value) {
      var alarmTime = alarmList[index].time;
      if (alarmTime.isBefore(DateTime.now())) {
        alarmTime = alarmTime.add(const Duration(days: 1));
      }
      await NotificationService.scheduleAlarm(alarmTime, id);
    } else {
      await NotificationService.cancelAlarm(id);
    }

    await HiveService.updateAlarm(alarmList[index]);
    alarmList.refresh();
  }
}
}
