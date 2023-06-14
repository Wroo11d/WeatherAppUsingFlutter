import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/utils/extensions.dart';
import 'package:weather_app/utils/temp_converter.dart';

import 'weather.dart';

class Forecast {
  final TimeOfDay lastUpdated;
  final List<Weather> daily;
  Weather current;
  bool isDayTime;
  String city;
  String date;
  bool isFavourite = false;

  Forecast(
      {required this.lastUpdated,
      this.daily = const [],
      required this.current,
      this.city = '',
      required this.isDayTime,
      required this.date});

  static Forecast fromJson(dynamic json) {
    var weather = json['current']['weather'][0];
    var date =
        DateTime.fromMillisecondsSinceEpoch(json['current']['dt'] * 1000);

    var sunrise =
        DateTime.fromMillisecondsSinceEpoch(json['current']['sunrise'] * 1000);

    var sunset =
        DateTime.fromMillisecondsSinceEpoch(json['current']['sunset'] * 1000);

    bool isDay = date.isAfter(sunrise) && date.isBefore(sunset);

    bool hasDaily = json['daily'] != null;
    List<Weather> tempDaily = [];
    if (hasDaily) {
      List items = json['daily'];
      tempDaily = items
          .map((item) => Weather.fromDailyJson(item))
          .toList()
          .skip(1)
          .take(7)
          .toList();
    }

    var currentForcast = Weather(
      cloudiness: int.parse(json['current']['clouds'].toString()),
      temp:
          '${Weather.formatTemperature(TempConverter.kelvinToCelsius(double.parse(json['current']['temp'].toString())))}°',
      condition: Weather.mapStringToWeatherCondition(
          weather['main'], int.parse(json['current']['clouds'].toString())),
      description: weather['description'].toString().capitalize(),
      feelLikeTemp:
          '${Weather.formatTemperature(TempConverter.kelvinToCelsius(double.parse(json['current']['feels_like'].toString())))}°',
      date: DateFormat('d EEE').format(date),
    );

    return Forecast(
        lastUpdated: TimeOfDay.fromDateTime(DateTime.now()),
        current: currentForcast,
        daily: tempDaily,
        isDayTime: isDay,
        date: DateFormat('d EEE').format(date));
  }
}
