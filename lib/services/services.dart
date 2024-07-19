import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spiderweb/models/WeatherModel.dart';

import '../constants.dart';
import '../helpers/network_helper.dart';

class ServicesClass {
  static Future<Object> getWeatherData(String cityName) async {
    var url = Uri.parse(
        "http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$OPENWEATHER_API_KEY");


    var response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedReponse = jsonDecode(response.body);

      if (decodedReponse is List) {
        print("list");
        List<WeaherModel> weatherList =
            decodedReponse.map((item) => WeaherModel.fromJson(item)).toList();
        return Success(statusCode: 200, response: weatherList);
      } else if (decodedReponse is Map<String, dynamic>) {
        print("map");
        WeaherModel weaherModel = WeaherModel.fromJson(decodedReponse);
        print(weaherModel);
        return Success(statusCode: 200, response: [weaherModel]);
      } else {
        return Failure(
            statusCode: response.statusCode, response: "Invalid Response");
      }
    }
    return Failure(
        statusCode: response.statusCode, response: "Invalid Response");
  }
}
