import 'package:flutter/material.dart';
import 'package:clima_github/utilities/constants.dart';

class NowCard extends StatelessWidget {
  NowCard({required this.temperature, required this.condition});
  final int temperature;
  var condition;

  void getWeatherIcon() {
    if (condition=='storm') {
      condition = Icons.thunderstorm;
    } else if (condition=='rain') {
      condition = Icons.water_drop;
    } else if (condition=='snow') {
      condition = Icons.ac_unit_rounded;
    } else if (condition=='astmosphere') {
      condition = Icons.waves;
    } else if (condition=='sunny') {
      condition = Icons.sunny;
    } else if (condition=='cloudy') {
      condition = Icons.cloud;
    } else {
      condition = Icons.close;
    }
  }

  @override
  Widget build(BuildContext context) {
    getWeatherIcon();
    return Container(
      height: 115,
      width: 80,
      decoration: BoxDecoration(
        color: Color(0xFFC4E2FF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Now', style: kNowTextStyle,),
          Icon(condition ,color: Colors.white, size: 50.0,),
          Text('$temperature°', style: kTempTextStyle,)
        ],
      ),
    );
  }
}
