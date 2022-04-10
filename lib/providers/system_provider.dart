import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rpi_weather/models/system_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rpi_weather/services/weather_service.dart';

class SystemProvider with ChangeNotifier {
  SystemModel systemModel = SystemModel();
  final TextEditingController _controllerText;
  final WeatherService _weatherService = WeatherService();
  // ignore: unused_field
  late Timer? _timer;

  SystemProvider(this._controllerText) {
    initialState();
    _timer = Timer.periodic(const Duration(seconds: 10), updateWeatherHelper);
  }

  void initialState() {
    syncDataWithProvider();
  }

  void changeEditState() {
    systemModel.changeEnableEditState();
    notifyListeners();
  }

  SystemModel getSystemModel() {
    return systemModel;
  }

  bool? getEditState() {
    return systemModel.getEnableEditState();
  }

  String? getWeatherUrl() {
    return WeatherService().getWeatherIcon(systemModel.iconValue);
  }

  String? getLocation() {
    return systemModel.getLocation();
  }

  void setLocation(String newLocation) async {
    systemModel.setLocation(newLocation);
    //Update controller text to capitalize it
    _controllerText.text = systemModel.getLocation()!;
    await updateWeather();
    updateSharedPreferences();
    notifyListeners();
  }

  void configureSystem(SystemModel _systemModel) {
    systemModel = _systemModel;
    updateSharedPreferences();
    //notifyListeners();
  }

  void updateSystemModel(SystemModel _systemModel) async {
    systemModel = _systemModel;
    await updateWeather();
    updateSharedPreferences();
    notifyListeners();
  }

  void updateSharedPreferences() async {
    String mySystemModel = json.encode(systemModel.toJson());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('systemModel', mySystemModel);
  }

  Future syncDataWithProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var mySettings = prefs.getString('systemModel');

    if (mySettings != null) {
      systemModel = SystemModel.fromJson(json.decode(mySettings));
      _controllerText.text = systemModel.getLocation()!;
      notifyListeners();
    }
  }

  void updateWeatherHelper(Timer timer) async {
    print(DateTime.now());
    await updateWeather();
    updateSharedPreferences();
    notifyListeners();
  }

  Future<void> updateWeather() async {
    var weatherData =
        await _weatherService.getCityWeather(systemModel.getLocation()!);
    systemModel.setWeatherData(weatherData);
  }
}
