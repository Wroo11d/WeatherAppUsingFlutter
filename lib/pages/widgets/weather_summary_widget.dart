import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';

class WeatherSummaryWidget extends StatelessWidget {
  const WeatherSummaryWidget(
      {Key? key,
      required this.date,
      required this.condition,
      required this.temp,
      required this.feelsLike})
      : super(key: key);

  final WeatherCondition condition;
  final String temp;
  final String feelsLike;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(date,
            style: const TextStyle(
              fontSize: 40,
              color: Colors.white,
            )),
        Column(
          children: [
            Text(
              temp,
              style: const TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              'Feels like $feelsLike',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
