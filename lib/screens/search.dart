import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/providers/WeatherModel_Provider.dart';
import 'package:weatherapp/services/weather_service.dart';

class searchpage extends StatelessWidget {
  String? cityname;
  searchpage({this.updateUi});
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search the city'),
      ),
      body: Center(
        child: TextField(
          onSubmitted: (data) async {
            cityname = data;
            weatherservice services = weatherservice();
            WeatherModel weather =
                await services.getWeather(cityName: cityname!);
            Provider.of<WeatherModelProvider>(context, listen: false)
                .weatherData = weather;
            Provider.of<WeatherModelProvider>(context, listen: false).cityName =
                cityname;

            Navigator.pop(context);
          },
          decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              label: Text('Search'),
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              hintText: "Enter a city"),
        ),
      ),
    );
  }
}
