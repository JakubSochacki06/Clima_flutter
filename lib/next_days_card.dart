import 'package:flutter/material.dart';
import 'package:clima_github/utilities/constants.dart';

class NextDaysCard extends StatelessWidget {
  NextDaysCard({required this.temp, required this.date, required this.condition});
  final date;
  final temp;
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(35,0,0,0),
          child: Text(
            '${date.toString().substring(0,2)}.${date.toString().substring(3,5)}',
            style: kDateTextStyle,
          ),
        ),
        Text('${temp.toString().substring(0,2).replaceAll('.', '')}°', style: kTempTextStyle,),
        Padding(
          padding: const EdgeInsets.fromLTRB(0,0,50,0),
          child: Icon(condition, size: 50, color: color,),
        ),
      ],
    );
  }
}