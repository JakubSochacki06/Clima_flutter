import 'package:flutter/material.dart';
import 'package:clima_github/utilities/constants.dart';
import 'package:clima_github/services/networking.dart';

class NextHoursCard extends StatelessWidget {
  NextHoursCard({required this.temp, required this.hour, required this.condition});
  final String hour;
  final double temp;
  var condition;
  var color;

  void getWeatherIcon() {
    if (condition=='storm') {
      color = Color(0xFF06729D);
      condition = Icons.thunderstorm;
    } else if (condition=='rain') {
      color = Color(0xFF33C5FF);
      condition = Icons.water_drop;
    } else if (condition=='snow') {
      color = Color(0xFFB4EAFF);
      condition = Icons.ac_unit_rounded;
    } else if (condition=='astmosphere') {
      color = Color(0xFF4691AD);
      condition = Icons.waves;
    } else if (condition=='sunny') {
      color = Color(0xFFFFD347);
      condition = Icons.sunny;
    } else if (condition=='cloudy') {
      color = Color(0xFFADEEFF);
      condition = Icons.cloud;
    } else {
      color = Color(0xFFFF0000);
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
        color: Color(0x100C4E2FF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('${hour.substring(11, 16)}', style: kNowTextStyle,),
          Icon(condition, color: color,size: 50,),
          Text('${temp.round()}°', style: kTempTextStyle,)
        ],
      ),
    );
  }
}
