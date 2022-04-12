import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rpi_weather/services/networking_service.dart';

import 'network_service_test.mocks.dart';

@GenerateMocks([NetworkHelper])
void main() {
  test('Test getData transforms json to Maps', () async {
    final MockNetworkHelper network = MockNetworkHelper();

    double temperature = 20.0;
    int humidity = 40;
    final weatherData = {
      'main': {'temp': temperature, 'humidity': humidity},
      'weather': [
        {'id': 0, 'icon': "", 'description': ""}
      ]
    };

    when(network.getData()).thenAnswer((_) async => weatherData);

    expect(await network.getData(), isA<Map>());
  });

}
