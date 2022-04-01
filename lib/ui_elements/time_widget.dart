import 'package:flutter/material.dart';
import 'package:rpi_weather/resources/ui_constants.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxStyle.copyWith(color: Colors.deepOrangeAccent),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Text(
              "18:31",
              style: kClockStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Text(
              "Jueves 24 de Abril de 2022",
              style: kDateStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
