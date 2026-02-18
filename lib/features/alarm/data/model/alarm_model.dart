class AlarmModel {
  final int id;
  final DateTime time;
  bool isEnabled;

  AlarmModel({
    required this.id,
    required this.time,
    required this.isEnabled,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'time': time.toIso8601String(),
    'isEnabled': isEnabled,
  };

  factory AlarmModel.fromJson(Map<String, dynamic> json) => AlarmModel(
    id: json['id'],
    time: DateTime.parse(json['time']),
    isEnabled: json['isEnabled'],
  );
}