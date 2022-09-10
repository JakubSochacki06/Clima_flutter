import 'package:flutter/material.dart';
import 'package:clima_github/utilities/constants.dart';
import 'package:clima_github/services/weather.dart';
import 'city_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:clima_github/now_card.dart';
import 'package:clima_github/next_hours_card.dart';
import 'package:clima_github/services/networking.dart';
import 'package:clima_github/next_days_card.dart';
import 'package:clima_github/services/location.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({
    required this.weatherData,
    required this.next3HoursData,
  });

  final weatherData;
  final next3HoursData;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('My Personal Journal');
  final cityController = TextEditingController();

  WeatherModel weather = WeatherModel();
  int? temperature;
  String? weatherIcon;
  String? cityName;
  String? bottomMessage;

  String? NextHourHour1;
  double? NextHourTemp1;
  String? NextHourCondition1;

  String? NextHourHour2;
  double? NextHourTemp2;
  String? NextHourCondition2;

  String? NextHourHour3;
  double? NextHourTemp3;
  String? NextHourCondition3;

  // String? NextDaysDate1;
  // double? NextDaysTemp1;
  // String? NextDaysCondition1;
  //
  // String? NextDaysDate2;
  // double? NextDaysTemp2;
  // String? NextDaysCondition2;
  //
  // String? NextDaysDate3;
  // double? NextDaysTemp3;
  // String? NextDaysCondition3;
  //
  // String? NextDaysDate4;
  // double? NextDaysTemp4;
  // String? NextDaysCondition4;
  //
  // String? NextDaysDate5;
  // double? NextDaysTemp5;
  // String? NextDaysCondition5;

  List nextDaysTempList = [0, 0, 0, 0, 0];
  List nextDaysConditionList = ['error', 'error', 'error', 'error', 'error'];
  List nextDaysDateList = ['error', 'error', 'error', 'error', 'error'];
  @override
  void initState() {
    updateUI(widget.weatherData);
    createNextHoursInputs(widget.next3HoursData);
    createNextDaysInput(widget.next3HoursData);
    super.initState();
  }

  void updateUI(dynamic weatherdata) {
    setState(() {
      if (weatherdata == null) {
        temperature = 0;
        weatherIcon = 'Error';
        bottomMessage = 'Unable to get your localization.';
        cityName = 'Error';
        cityController.text = '';
        return;
      }
      double temp = weatherdata['main']['temp'];
      temperature = temp.toInt();
      bottomMessage = weather.getMessage(temperature!);
      var condition = weatherdata['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      cityName = weatherdata['name'];
    });
  }

  void createNextHoursInputs(next3HoursData) {
    setState(() {
      if (next3HoursData == null) {
        NextHourHour1 = 'error errorerror';
        NextHourTemp1 = 0;
        NextHourCondition1 = 'error';

        NextHourHour2 = 'error errorerror';
        NextHourTemp2 = 0;
        NextHourCondition2 = 'error';

        NextHourHour3 = 'error errorerror';
        NextHourTemp3 = 0;
        NextHourCondition3 = 'error';
      } else {
        DateTime now = DateTime.now();
        NextHourHour1 = next3HoursData['list'][0]['dt_txt'];
        if (now.hour >= int.parse(NextHourHour1!.substring(11, 13))) {
          NextHourHour1 = next3HoursData['list'][1]['dt_txt'];
          NextHourTemp1 = double.parse(next3HoursData['list'][1]['main']['temp'].toString());
          NextHourCondition1 = WeatherModel()
              .getWeatherIcon(next3HoursData['list'][1]['weather'][0]['id']);

          NextHourHour2 = next3HoursData['list'][2]['dt_txt'];
          NextHourTemp2 = next3HoursData['list'][2]['main']['temp'];
          NextHourCondition2 = WeatherModel()
              .getWeatherIcon(next3HoursData['list'][2]['weather'][0]['id']);

          NextHourHour3 = next3HoursData['list'][3]['dt_txt'];
          NextHourTemp3 = next3HoursData['list'][3]['main']['temp'];
          NextHourCondition3 = WeatherModel()
              .getWeatherIcon(next3HoursData['list'][3]['weather'][0]['id']);
        } else {
          NextHourHour1 = next3HoursData['list'][0]['dt_txt'];
          NextHourTemp1 = next3HoursData['list'][0]['main']['temp'];
          NextHourCondition1 = WeatherModel()
              .getWeatherIcon(next3HoursData['list'][0]['weather'][0]['id']);

          NextHourHour2 = next3HoursData['list'][1]['dt_txt'];
          NextHourTemp2 = next3HoursData['list'][1]['main']['temp'];
          NextHourCondition2 = WeatherModel()
              .getWeatherIcon(next3HoursData['list'][1]['weather'][0]['id']);

          NextHourHour3 = next3HoursData['list'][2]['dt_txt'];
          NextHourTemp3 = next3HoursData['list'][2]['main']['temp'];
          NextHourCondition3 = WeatherModel()
              .getWeatherIcon(next3HoursData['list'][2]['weather'][0]['id']);
        }
      }
    });
  }

  void createNextDaysInput(nextDaysData) {
    if (nextDaysData == null) {
      nextDaysTempList[0] = 00.34;
      nextDaysConditionList[0] = 'error';
      nextDaysDateList[0] = 'error';

      nextDaysTempList[1] = 00.34;
      nextDaysConditionList[1] = 'error';
      nextDaysDateList[1] = 'error';

      nextDaysTempList[2] = 00.34;
      nextDaysConditionList[2] = 'error';
      nextDaysDateList[2] = 'error';

      nextDaysTempList[3] = 00.34;
      nextDaysConditionList[3] = 'error';
      nextDaysDateList[3] = 'error';

      nextDaysTempList[4] = 00.34;
      nextDaysConditionList[4] = 'error';
      nextDaysDateList[4] = 'error';
    } else {
      nextDaysDateList.clear();
      nextDaysTempList.clear();
      nextDaysConditionList.clear();
      for (var i in nextDaysData.values) {
        if (i == '200' || i == 0 || i == 40) {
        } else {
          try {
            List<dynamic> data = i;
            for (i in data) {
              if (i['dt_txt'].toString().substring(11, 13) == '12') {
                nextDaysTempList.add(i['main']['temp']);
                nextDaysConditionList
                    .add(WeatherModel().getWeatherIcon(i['weather'][0]['id']));
                nextDaysDateList.add(i['dt_txt'].toString().substring(5, 10));
              } else {}
            }
          } catch (e) {}
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '$cityName',
                        style: kTempTextStyle,
                        textAlign: TextAlign.right,
                      ),
                      Icon(
                        Icons.location_on,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Alert(
                          context: context,
                          content: Column(
                            children: <Widget>[
                              TextField(
                                controller: cityController,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.location_city),
                                  labelText: 'City',
                                  hintText: 'Enter your city',
                                ),
                              ),
                            ],
                          ),
                          buttons: [
                            DialogButton(
                              onPressed: () async {
                                WeatherModel weatherModel = WeatherModel();
                                cityName = cityController.text;
                                var weatherData = await weatherModel
                                    .getCityWeather(cityName!);
                                updateUI(weatherData);
                                NetworkHelper networkHelper = NetworkHelper(
                                    url:
                                        'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=cca8d217e33ef6a196de0b9b2e332fb7&units=metric');
                                var Next3HoursData =
                                    await networkHelper.getData();
                                createNextHoursInputs(Next3HoursData);
                                createNextDaysInput(Next3HoursData);

                                Navigator.pop(context);
                                cityController.text = '';
                              },
                              color: Colors.blue,
                              child: Text(
                                "CHECK WEATHER",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ]).show();
                    },
                    icon: Icon(
                      Icons.search,
                      color: Color(0xFF34374C),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 1,
              width: 350.0,
              child: Divider(
                thickness: 2.5,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: NowCard(
                          temperature: temperature!, condition: weatherIcon),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: NextHoursCard(
                          hour: NextHourHour1!,
                          temp: NextHourTemp1!,
                          condition: NextHourCondition1),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: NextHoursCard(
                          hour: NextHourHour2!,
                          temp: NextHourTemp2!,
                          condition: NextHourCondition2),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: NextHoursCard(
                          hour: NextHourHour3!,
                          temp: NextHourTemp3!,
                          condition: NextHourCondition3),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NextDaysCard(
                      temp: nextDaysTempList[0],
                      condition: nextDaysConditionList[0],
                      date: nextDaysDateList[0],
                    ),
                    Spacer(),
                    NextDaysCard(
                      temp: nextDaysTempList[1],
                      condition: nextDaysConditionList[1],
                      date: nextDaysDateList[1],
                    ),
                    Spacer(),
                    NextDaysCard(
                      temp: nextDaysTempList[2],
                      condition: nextDaysConditionList[2],
                      date: nextDaysDateList[2],
                    ),
                    Spacer(),
                    NextDaysCard(
                      temp: nextDaysTempList[3],
                      condition: nextDaysConditionList[3],
                      date: nextDaysDateList[3],
                    ),
                    Spacer(),
                    NextDaysCard(
                      temp: nextDaysTempList[4],
                      condition: nextDaysConditionList[4],
                      date: nextDaysDateList[4],
                    ),
                    SizedBox(
                      height: 60,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
