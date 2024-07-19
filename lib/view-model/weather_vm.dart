import 'package:flutter/material.dart';
import 'package:spiderweb/models/WeatherModel.dart';

import '../helpers/network_helper.dart';
import '../services/services.dart';

class WeatherViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<WeaherModel> _weatherModel = [];
  List<WeaherModel> get weatherModel => _weatherModel;
  setWeatherModel(List<WeaherModel> weatherModel) {
    _weatherModel = weatherModel;
  }

  getWeatherResponse(cityName) async {
    setLoading(true);
    final response = await ServicesClass.getWeatherData(cityName);

    if (response is Success) {
      setWeatherModel(response.response as List<WeaherModel>);
    } else if (response is Failure) {
      print(response.response);
    }
    setLoading(false);
  }
}
