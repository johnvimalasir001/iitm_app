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
  double? temperatureApparent;
  double? humidity;
  double? dewPoint;
  double? windSpeed;
  double? windDirection;
  double? windGust;
  double? pressureSurfaceLevel;
  int? visibility;

  MinuteValues({
    this.temperature,
    this.temperatureApparent,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDirection,
    this.windGust,
    this.pressureSurfaceLevel,
    this.visibility,
  });

  factory MinuteValues.fromJson(Map<String, dynamic> json) {
    try {
      return MinuteValues(
        temperature: (json['temperature'] ?? 0.0) as double?,
        temperatureApparent: (json['temperatureApparent'] ?? 0.0) as double?,
        humidity: (json['humidity'] ?? 0.0) as double?,
        dewPoint: (json['dewPoint'] ?? 0.0) as double?,
        windSpeed: (json['windSpeed'] ?? 0.0) as double?,
        windDirection: (json['windDirection'] ?? 0.0) as double?,
        windGust: (json['windGust'] ?? 0.0) as double?,
        pressureSurfaceLevel: (json['pressureSurfaceLevel'] ?? 0.0) as double,
        visibility: (json['visibility'] ?? 0) as int?,
      );
    } catch (e) {
      log("error: $e");
    }
    return MinuteValues(
      temperature: 90.0,
      temperatureApparent: 90.0,
      humidity: 90.0,
      dewPoint: 90.0,
      windSpeed: 90.0,
      windDirection: 90.0,
      windGust: 90.0,
      pressureSurfaceLevel: 90.0,
      visibility: 90,
    );
  }
}
