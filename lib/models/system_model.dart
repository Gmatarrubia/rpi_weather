import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class SystemModel {
  bool enableEditState = false;
  double temperature = 0.0;
  int humidity = 0;
  int weatherValue = 0;
  String iconValue = "";
  String weatherDescription = "";
  String location = "";

  bool? getEnableEditState() {
    return enableEditState;
  }

  changeEnableEditState() {
    enableEditState = !enableEditState;
  }

  setLocation(String newLocation) {
    location = toBeginningOfSentenceCase(newLocation)!;
  }

  String? getLocation() {
    return toBeginningOfSentenceCase(location);
  }

  setWeatherData(dynamic weatherData) {
    if (weatherData != null) {
      temperature = weatherData['main']['temp'];
      humidity = weatherData['main']['humidity'];
      weatherValue = weatherData['weather'][0]['id'];
      iconValue = weatherData['weather'][0]['icon'];
      weatherDescription = weatherData['weather'][0]['description'];
      weatherDescription = toBeginningOfSentenceCase(weatherDescription)!;
    }
  }

  Map toJson() => {
        'location': location,
      };

  SystemModel() {
    location = "";
  }

  SystemModel.fromJson(Map json) : location = json['location'];
}
