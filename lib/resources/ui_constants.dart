import 'package:flutter/material.dart';

const Color kBackgroundColor = Color(0xFF90A4A3);
const Color kTimeBackgroundColor = Color(0xFF90A4A3);
const Color kWeatherBackgroundColor = Color(0xFF90A4A3);

const Color kTextColor = Color.fromARGB(255, 27, 27, 27);
const int kBoxBackgroundAlpha = 200;

const kClockStyle = TextStyle(
  fontSize: 45.0,
  fontFamily: 'nonito-semibold',
  color: kTextColor,
);

const kDateStyle = TextStyle(
  fontSize: 36.0,
  fontFamily: 'nonito',
  color: kTextColor,
);

const kColorWeatherBox = Color.fromARGB(255, 231, 229, 210);

const kLocationStyle = TextStyle(
  fontSize: 40.0,
  fontFamily: 'nonito-semibold',
  color: kTextColor,
);

final kBoxStyle = BoxDecoration(
  borderRadius: BorderRadius.circular(20),
);

const kBoxBackground = BoxDecoration(
  image: DecorationImage(
    image: AssetImage("images/fondo.jpg"),
    fit: BoxFit.cover,
  ),
);
