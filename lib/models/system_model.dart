class SystemModel {
  bool enableEditState = false;
  double temperature = 0.0;
  double humidity = 0.0;
  int wheaterValue = 0;
  String location = "Enter location";

  bool? getEnableEditState() {
    return enableEditState;
  }

  changeEnableEditState() {
    enableEditState = !enableEditState;
  }

  setLocation(String newLocation) {
    location = newLocation;
  }

  String? getLocation() {
    return location;
  }

  Map toJson() => {
        'location': location,
      };

  SystemModel() {
    location = "Madrid";
  }

  SystemModel.fromJson(Map json) : location = json['location'];
}
