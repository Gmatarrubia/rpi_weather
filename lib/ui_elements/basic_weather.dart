import 'package:flutter/material.dart';
import 'package:rpi_weather/resources/ui_constants.dart';

class BasicWeather extends StatelessWidget {
  final String weatherDescription;
  final int wheaterValue;
  const BasicWeather({Key? key,
   required this.weatherDescription,
   required this.wheaterValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxStyle.copyWith(
          color: Colors.lightBlueAccent.withAlpha(kBoxBackgroundAlpha)),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Flexible(
            flex: 1,
            child: Image(
              image: AssetImage("images/icono.png"),
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              weatherDescription,
              style: kClockStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
