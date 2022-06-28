import 'package:flutter_test/flutter_test.dart';
import 'package:rpi_weather/models/system_model.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

void main() {
  test('Set Location in model', () {
    SystemModel model = SystemModel();
    expect(model.getLocation(), "");

    String city = "madrid";
    model.setLocation(city);
    expect(model.getLocation(), toBeginningOfSentenceCase(city));
  });

  test('Set WeatherData in model', () {
    SystemModel model = SystemModel();
    expect(model.temperature, 0.0);
    expect(model.humidity, 0);
    expect(model.weatherValue, 0);
    expect(model.iconValue, "");
    expect(model.weatherDescription, "");
    expect(model.timeZone, 0);

    double temperature = 20.0;
    int humidity = 40;
    int timezone = 7200000;
    dynamic weatherData;
    weatherData = {
      'main': {'temp': temperature, 'humidity': humidity},
      'weather': [
        {'id': 0, 'icon': "", 'description': ""}
      ],
      'timezone' : timezone,
    };

    model.setWeatherData(weatherData);
    expect(model.temperature, temperature);
    expect(model.humidity, humidity);
  });
}
