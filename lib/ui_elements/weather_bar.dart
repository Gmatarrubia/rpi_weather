import 'package:flutter/material.dart';
import 'package:rpi_weather/resources/ui_constants.dart';
import 'package:rpi_weather/ui_elements/basic_weather.dart';
import 'package:rpi_weather/ui_elements/info_weather.dart';

class WeatherBar extends StatelessWidget {
  const WeatherBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const <Widget>[
        Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: BasicWeather()),
        VerticalDivider(
          color: kTextColor,
          thickness: 2,
          indent: 25,
          endIndent: 25,
        ),
        Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: InfoWeather()),
      ],
    );
  }
}