import 'package:flutter/material.dart';
import 'package:rpi_weather/resources/ui_constants.dart';

class InfoWeather extends StatelessWidget {
  final double temperature;
  final double humidity;
  const InfoWeather(
      {Key? key, required this.temperature, required this.humidity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxStyle.copyWith(
          color: Colors.brown.withAlpha(kBoxBackgroundAlpha)),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/temperature.png",
                width: 40.0,
                height: 55.0,
              ),
              Text(
                temperature.toString() + "ºC",
                style: kClockStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/humidity.png",
                width: 55.0,
                height: 55.0,
              ),
              Text(
                humidity.toString() + "%",
                style: kClockStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
