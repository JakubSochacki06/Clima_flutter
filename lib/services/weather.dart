import 'package:clima_github/services/networking.dart';
import 'package:clima_github/services/location.dart';
const kApiKey = 'cca8d217e33ef6a196de0b9b2e332fb7';
const kOpenWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
//TODO: const to constants.dart
class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    var url = '$kOpenWeatherMapURL?q=$cityName&appid=$kApiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentPosition();

    NetworkHelper networkHelper = NetworkHelper(url: '$kOpenWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey&units=metric');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }
  String getWeatherIcon(int? condition) {
    if (condition! < 300) {
      return 'storm';
    } else if (condition < 600) {
      return 'rain';
    } else if (condition < 700) {
      return 'snow';
    } else if (condition < 800) {
      return 'atmoshpehre';
    } else if (condition == 800) {
      return 'sunny';
    } else if (condition <= 804) {
      return 'cloudy';
    } else {
      return 'idk';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}