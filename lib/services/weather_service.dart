import 'package:rpi_weather/services/networking_service.dart';
import 'package:rpi_weather/models/system_model.dart';

const apiKey = '3dca52a1fe2b1b18871d9c0c173fb68c';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherService {
  void setWeatherDataInModel(SystemModel model) async {
    var weatherData = await getCityWeather(model.getLocation()!);
    model.setWeatherData(weatherData);
  }

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&lang=es&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(String iconValue) {
    if (iconValue.isNotEmpty) {
      return "http://openweathermap.org/img/wn/" + iconValue + "@4x.png";
    } else {
      return "";
    }
  }
}
