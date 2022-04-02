import 'package:flutter/material.dart';
import 'package:rpi_weather/resources/ui_constants.dart';

class BasicWeather extends StatelessWidget {
  const BasicWeather({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxStyle.copyWith(
          color: Colors.lightBlueAccent.withAlpha(kBoxBackgroundAlpha)),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Flexible(
            flex: 1,
            child: Image(
              image: AssetImage("images/icono.png"),
            ),
          ),
          Flexible(
            flex: 1,
            child: Text(
              "Parciamente Nublado",
              style: kClockStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
