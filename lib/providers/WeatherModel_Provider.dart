import 'package:flutter/cupertino.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherModelProvider extends ChangeNotifier {
  WeatherModel? _WeatherData;
  String? cityName;

  set weatherData(WeatherModel? weather) {
    _WeatherData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData => _WeatherData;
}
