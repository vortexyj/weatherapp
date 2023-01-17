import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/providers/WeatherModel_Provider.dart';
import 'package:weatherapp/screens/Homepage.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherModelProvider();
      },
      child: weatherapp()));
}

class weatherapp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:
            Provider.of<WeatherModelProvider>(context).weatherData == null
                ? Colors.blue
                : Provider.of<WeatherModelProvider>(context)
                    .weatherData!
                    .getThemeColor(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
