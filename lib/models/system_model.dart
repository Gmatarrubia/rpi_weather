class SystemModel {
  bool enableEditState = false;
  double temperature = 0.0;
  double humidity = 0.0;
  int wheaterValue = 0;
  String location = "Madrid";

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
