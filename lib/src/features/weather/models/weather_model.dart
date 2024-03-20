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
  double? visibility;

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
    return MinuteValues(
      temperature: json['temperature']?.toDouble(), // Convert int to double
      temperatureApparent: json['temperatureApparent']?.toDouble(),
      humidity: json['humidity']?.toDouble(),
      dewPoint: json['dewPoint']?.toDouble(),
      windSpeed: json['windSpeed']?.toDouble(),
      windDirection: json['windDirection']?.toDouble(),
      windGust: json['windGust']?.toDouble(),
      pressureSurfaceLevel: json['pressureSurfaceLevel']?.toDouble(),
      visibility: json['visibility']?.toDouble(),
    );
  }
}
