import 'package:flutter/material.dart';
import 'package:rpi_weather/resources/ui_constants.dart';
import 'package:rpi_weather/ui_elements/basic_weather.dart';
import 'package:rpi_weather/ui_elements/info_weather.dart';
import 'package:rpi_weather/services/weather_service.dart';

class WeatherBar extends StatefulWidget {
  const WeatherBar({
    Key? key,
  }) : super(key: key);

  @override
  State<WeatherBar> createState() => _WeatherBarState();
}

class _WeatherBarState extends State<WeatherBar> {
  final WeatherService _weatherService = WeatherService();
  double temperature = 0;

  @override
  void initState() {
    super.initState();

    updateWeather();
  }

  void updateWeather() async {
    var weatherData = await _weatherService.getMadridWeather();
    setState(() {
      temperature = weatherData['main']['temp'];
      var condition = weatherData['weather'][0]['id'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const <Widget>[
        Flexible(flex: 1, fit: FlexFit.tight, child: BasicWeather()),
        VerticalDivider(
          color: kTextColor,
          thickness: 2,
          indent: 25,
          endIndent: 25,
        ),
        Flexible(flex: 1,
         fit: FlexFit.tight,
         child: InfoWeather(
           temperature: 31.0,
           humidity: 42.0,
         )),
      ],
    );
  }
}
