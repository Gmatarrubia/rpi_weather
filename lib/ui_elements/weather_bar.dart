import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpi_weather/providers/system_provider.dart';
import 'package:rpi_weather/resources/ui_constants.dart';
import 'package:rpi_weather/ui_elements/basic_weather.dart';
import 'package:rpi_weather/ui_elements/info_weather.dart';

class WeatherBar extends StatelessWidget {
  const WeatherBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SystemProvider>(builder: (context, systemProvider, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: BasicWeather(
              iconUrl: systemProvider.getWeatherUrl()!,
              weatherDescription: systemProvider.systemModel.weatherDescription,
            )),
          const VerticalDivider(
            color: kTextColor,
            thickness: 2,
            indent: 25,
            endIndent: 25,
          ),
          Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: InfoWeather(
                temperature: systemProvider.systemModel.temperature,
                humidity: systemProvider.systemModel.humidity,
              )),
        ],
      );
    });
  }
}
