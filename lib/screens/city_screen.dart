import 'package:climate/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(18.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/starts.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      FontAwesomeIcons.arrowLeft,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFilledInputDecoration,
                  onChanged: (e) {
                    cityName = e;
                  },
                ),
              ),
              const SizedBox(height: 50.0),
              Container(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context, cityName);
                  },
                  child: const Text(
                    'Get Weather',
                    style: TextStyle(color: Colors.white, fontSize: 50.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
