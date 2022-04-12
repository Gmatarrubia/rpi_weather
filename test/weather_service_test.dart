import 'package:flutter_test/flutter_test.dart';
import 'package:rpi_weather/services/weather_service.dart';
import 'package:rpi_weather/models/system_model.dart';

void main() {
  test('Test WeatherService update the model successfully', () async {

    final WeatherService weatherService = WeatherService();
    SystemModel model = SystemModel();
    model.setLocation("Madrid");

    model = await weatherService.setWeatherDataInModel(model);

    expect(model.humidity, greaterThan(10));
    expect(model.iconValue, isNotEmpty);
  });

    test('Test WeatherService manages an model', () async {

    final WeatherService weatherService = WeatherService();
    SystemModel model = SystemModel();


    model = await weatherService.setWeatherDataInModel(model);

    expect(model.humidity, 0);
    expect(model.iconValue, isEmpty);
  });
}
