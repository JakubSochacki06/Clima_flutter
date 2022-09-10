import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima_github/services/weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima_github/next_hours_card.dart';
import 'package:clima_github/services/location.dart';
import 'package:clima_github/services/networking.dart';
const kApiKey = 'cca8d217e33ef6a196de0b9b2e332fb7';
const kOpenWeatherMapURL = 'https://api.openweathermap.org/data/2.5/forecast';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Location location = Location();
    await location.getCurrentPosition();
    NetworkHelper networkHelper = NetworkHelper(url: '$kOpenWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey&units=metric');
    var Next3HoursData = await networkHelper.getData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            weatherData: weatherData,
            next3HoursData: Next3HoursData,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitPouringHourGlass(
          color: Colors.black,
          size: 100.0,
        ),
      ),
    );
  }
}
