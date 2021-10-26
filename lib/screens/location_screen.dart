import 'package:climate/services/weather.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key, this.locationWeather}) : super(key: key);
  final dynamic locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temp = 0;
  int tempMin = 0;
  int tempMax = 0;
  int feelsLike = 0;
  IconData? weatherIcon; // id
  String city = '';
  String description = '';
  String weatherMsg = '';

  @override
  void initState() {
    updateUi(widget.locationWeather);
  }

  void updateUi(dynamic weatherData) {
    double tp = weatherData['main']['temp'];
    temp = tp.toInt();
    double tpMin = weatherData['main']['temp_min'];
    tempMax = tpMin.toInt();
    double tpMax = weatherData['main']['temp_max'];
    tempMin = tpMax.toInt();
    double tpFeel = weatherData['main']['feels_like'];
    feelsLike = tpFeel.toInt();

    var condition = weatherData['weather'][0]['id'];
    weatherIcon = weather.getWeatherIcon(condition);
    city = weatherData['name'];
    description = weatherData['weather'][0]['description'];

    weatherMsg = weather.getMessage(temp);
  }

  @override
  Widget build(BuildContext context) {
    // updateUi(widget.locationWeather);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/starts.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: Text(
                  'Weather',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFF1A1E20),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 48.0, 18.0, 18.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  city,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18.0),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.watch_later_outlined,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  DateFormat('dd/MM/yyyy').format(
                                    DateTime.now(),
                                  ),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  weatherIcon,
                                  color: Colors.white,
                                  size: 60.0,
                                ),
                                const SizedBox(width: 20.0),
                                Text(
                                  '$temp°',
                                  style: const TextStyle(
                                      color: Colors.yellowAccent,
                                      fontSize: 55.0),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      description,
                                      style: const TextStyle(
                                        color: Color(0xFF939292),
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    Text(
                                      '${tempMin - 1}°/ ${tempMax + 2}°',
                                      style: const TextStyle(
                                        color: Color(0xFF939292),
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    Text(
                                      'Feels like $feelsLike°',
                                      style: const TextStyle(
                                        color: Color(0xFF939292),
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              weatherMsg,
                              style: const TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ) /* add child content here */,
      ),
    );
  }
}
