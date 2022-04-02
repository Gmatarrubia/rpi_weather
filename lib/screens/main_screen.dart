import 'package:flutter/material.dart';
import 'package:rpi_weather/resources/ui_constants.dart';
import 'package:rpi_weather/ui_elements/top_bar.dart';
import 'package:rpi_weather/ui_elements/time_widget.dart';
import 'package:rpi_weather/ui_elements/basic_weather.dart';
import 'package:rpi_weather/ui_elements/info_weather.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: kBoxBackground,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: TopBar(),
                ),
              const Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: TimeWidget()),
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: BasicWeather()
                    ),
                    VerticalDivider(
                      color: kTextColor,
                      thickness: 2,
                      indent: 25,
                      endIndent: 25,
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: InfoWeather()
                    ),
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

