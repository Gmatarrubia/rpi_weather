import 'package:flutter/material.dart';
import 'package:rpi_weather/resources/ui_constants.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Text(
          "18:31",
          style: kClockStyle,
        ),
        Text(
          "Jueves 24 de Abril de 2022",
          style: kDateStyle,
        ),
      ],

    );
  }
}