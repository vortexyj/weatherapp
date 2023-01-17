import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/providers/WeatherModel_Provider.dart';
import 'package:weatherapp/screens/search.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData =
        Provider.of<WeatherModelProvider>(context, listen: true).weatherData;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: weatherData == null
                ? Colors.blue
                : weatherData?.getThemeColor(),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return searchpage(
                        updateUi: updateUi,
                      );
                    }));
                  },
                  icon: Icon(Icons.search))
            ],
            title: Text('Weather App'),
          ),
          body: weatherData == null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'There is no weather 😞',
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        'start searching now 🔍',
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      weatherData!.getThemeColor(),
                      weatherData!.getThemeColor()[300]!,
                      weatherData!.getThemeColor()[100]!,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(
                        flex: 3,
                      ),
                      Text(
                        Provider.of<WeatherModelProvider>(context).cityName ??
                            'Error',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'update : 12-8-2020',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(weatherData!.getImage()),
                          Text(
                            weatherData!.temp!.toInt().toString(),
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                  'maxTemp : ${weatherData!.maxTemp!.toInt()}'),
                              Text('minTemp : ${weatherData!.minTemp!.toInt()}')
                            ],
                          )
                        ],
                      ),
                      Spacer(),
                      Text(
                        weatherData?.weatherStateName ?? 'Error',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(
                        flex: 5,
                      ),
                    ],
                  ),
                ),
        ));
  }
}
