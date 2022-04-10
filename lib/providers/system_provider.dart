import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:rpi_weather/models/system_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SystemProvider with ChangeNotifier {
  SystemModel systemModel = SystemModel();

  SystemProvider() {
    initialState();
  }

  void initialState() {
    syncDataWithProvider();
  }

  void changeEditState() {
    systemModel.changeEnableEditState();
    notifyListeners();
  }

  bool? getEditState() {
    return systemModel.getEnableEditState();
  }

  String? getLocation() {
    return systemModel.getLocation();
  }

  void configureSystem(SystemModel _systemModel) {
    systemModel = _systemModel;
    updateSharedPreferences();
    //notifyListeners();
  }

  void updateSystemModel(SystemModel _systemModel) {
    systemModel = _systemModel;
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
      notifyListeners();
    }
  }
}
