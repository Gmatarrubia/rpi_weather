import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:rpi_weather/models/system_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SystemProvider with ChangeNotifier {
  SystemProvider() {
    initialState();
  }

SystemModel? systemModel;

  void initialState() {
    syncDataWithProvider();
  }

  void configureSystem(SystemModel _systemModel) {
    if (systemModel == null) {
      systemModel = _systemModel;
      updateSharedPreferences();
      //notifyListeners();
    }
  }

  void updateSystemModel(SystemModel _systemModel) {
    if (systemModel != null) {
      systemModel = _systemModel;
      updateSharedPreferences();
      notifyListeners();
    }
  }

  void updateSharedPreferences() async {
    if (systemModel != null) {
      String mySystemModel = json.encode(systemModel!.toJson());
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('systemModel', mySystemModel);
    }
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
