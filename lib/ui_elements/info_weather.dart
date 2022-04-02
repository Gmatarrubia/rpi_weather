import 'package:flutter/material.dart';
import 'package:rpi_weather/resources/ui_constants.dart';

class InfoWeather extends StatelessWidget {
  const InfoWeather({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxStyle.copyWith(
          color: Colors.brown.withAlpha(kBoxBackgroundAlpha)),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget>[
          Text(
            "T: 10ºC",
            style: kClockStyle,
          ),
          Text(
            "H: 45%",
            style: kClockStyle,
          ),
        ],
      ),
    );
  }
}
