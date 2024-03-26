import 'dart:developer';

class MinuteData {
  String time;
  MinuteValues values;

  MinuteData({
    required this.time,
    required this.values,
  });

  factory MinuteData.fromJson(Map<String, dynamic> json) {
    return MinuteData(
      time: json['time'],
      values: MinuteValues.fromJson(json['values']),
    );
  }
}

class MinuteValues {
  double? temperature;
  double? humidity;

  MinuteValues({
    this.temperature,
    this.humidity,
  });

  factory MinuteValues.fromJson(Map<String, dynamic> json) {
    try {
      return MinuteValues(
        temperature: json['temperature'] is int
            ? (json['temperature'] as int).toDouble()
            : json['temperature'] as double?,
        humidity: json['humidity'] is int
            ? (json['humidity'] as int).toDouble()
            : json['humidity'] as double?,
      );
    } catch (e) {
      log("error on weather model: $e");
    }
    return MinuteValues(
      temperature: 90.0,
      humidity: 90.0,
    );
  }
}

