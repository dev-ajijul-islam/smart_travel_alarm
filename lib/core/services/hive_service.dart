import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../../features/alarm/data/model/alarm_model.dart';

class HiveService {
  static const String boxName = 'alarms';
  static late Box<String> box;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox<String>(boxName);
  }

  static Future<void> addAlarm(AlarmModel alarm) async {
    await box.put(alarm.id.toString(), json.encode(alarm.toJson()));
  }

  static List<AlarmModel> getAlarms() {
    return box.values.map((value) => AlarmModel.fromJson(json.decode(value))).toList();
  }

  static Future<void> updateAlarm(AlarmModel alarm) async {
    await box.put(alarm.id.toString(), json.encode(alarm.toJson()));
  }

  static Future<void> deleteAlarm(int id) async {
    await box.delete(id.toString());
  }
}