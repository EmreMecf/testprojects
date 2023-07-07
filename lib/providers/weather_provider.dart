import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:testprojects/api/models/weather_model.dart';
import 'package:testprojects/api/weather_api.dart';

class WeatherProvider extends ChangeNotifier {
  final WeatherApi _api;
  String? error;
  bool isLoading = false;
  WeatherResponse? weatherResponse;

  WeatherProvider(this._api);

  Future getCurrentTemperature(Position position) async {
    isLoading = true;
    notifyListeners();

    try {
      weatherResponse = await _api.getCurrentTemperature(position);
      error = null;
    } catch (e) {
      print(e);
      error = "Failed to receive data";
    }

    isLoading = false;
    notifyListeners();
  }
}
