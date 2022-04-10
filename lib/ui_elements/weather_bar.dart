import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpi_weather/providers/system_provider.dart';
import 'package:rpi_weather/resources/ui_constants.dart';
import 'package:rpi_weather/ui_elements/basic_weather.dart';
import 'package:rpi_weather/ui_elements/info_weather.dart';
import 'package:rpi_weather/services/weather_service.dart';
import 'package:rpi_weather/models/system_model.dart';

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
  int humidity = 0;

  @override
  void initState() {
    //updateWeather();
    super.initState();
  }

  void updateWeather(BuildContext context) async {
    String location = Provider.of<SystemProvider>(context, listen: false).getLocation()!;
    var weatherData = await _weatherService.getCityWeather(location);
    //var weatherData = await _weatherService.getMadridWeather();
    setState(() {
      temperature = weatherData['main']['temp'];
      humidity = weatherData['main']['humidity'];
      var condition = weatherData['weather'][0]['id'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SystemProvider>(builder: ((context, systemProvider, child) {
      updateWeather(context);
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Flexible(flex: 1, fit: FlexFit.tight, child: BasicWeather()),
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
                temperature: temperature,
                humidity: humidity,
              )),
        ],
      );
    }));
  }
}
