import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class SystemModel {
  bool enableEditState = false;
  double temperature = 0.0;
  int humidity = 0;
  int weatherValue = 0;
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
    temperature = weatherData['main']['temp'];
    humidity = weatherData['main']['humidity'];
    wheaterValue = weatherData['weather'][0]['id'];
  }

  Map toJson() => {
        'location': location,
      };

  SystemModel() {
    location = "";
  }

  SystemModel.fromJson(Map json) : location = json['location'];
}
