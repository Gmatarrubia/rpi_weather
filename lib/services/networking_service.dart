import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  late Uri _url;

  NetworkHelper(String url){
    _url = Uri.parse(url);
  }

  Future getData() async {
    http.Response response = await http.get(_url);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}