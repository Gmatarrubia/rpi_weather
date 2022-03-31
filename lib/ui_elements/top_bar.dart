import 'package:flutter/material.dart';
import 'package:rpi_weather/resources/ui_constants.dart';

class TopBar extends StatelessWidget {
  const TopBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Text(
          "Madrid",
          style: kLocationStyle,
        ),
      ],

    );
  }
}