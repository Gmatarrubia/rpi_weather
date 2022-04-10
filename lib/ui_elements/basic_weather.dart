import 'package:flutter/material.dart';
import 'package:rpi_weather/resources/ui_constants.dart';

class BasicWeather extends StatelessWidget {
  final String weatherDescription;
  final String iconUrl;
  const BasicWeather(
      {Key? key, required this.weatherDescription, required this.iconUrl})
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
          Flexible(
            flex: 1,
            child: loadImage(iconUrl),
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

  Image loadImage(String iconURL) {
    if (iconUrl.isEmpty) {
      return const Image(image: AssetImage("images/icono.png"));
    } else {
      return Image.network(iconUrl);
    }
  }
}
