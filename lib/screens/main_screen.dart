import 'package:flutter/material.dart';
import 'package:rpi_weather/resources/ui_constants.dart';
import 'package:provider/provider.dart';
import 'package:rpi_weather/ui_elements/top_bar.dart';
import 'package:rpi_weather/ui_elements/time_bar.dart';
import 'package:rpi_weather/ui_elements/weather_bar.dart';
import 'package:rpi_weather/ui_elements/keyboard.dart';
import 'package:rpi_weather/providers/system_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _controllerText = TextEditingController();
  final FocusNode _locationFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SystemProvider>(
      create: (context) => SystemProvider(_controllerText),
      child: Container(
        constraints: const BoxConstraints.expand(),
        decoration: kBoxBackground,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: TopBar(
                        controllerText: _controllerText,
                        textFocus: _locationFocus,
                      ),
                    ),
                    const Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: TimeBar()
                    ),
                    const Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: WeatherBar(),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Keyboard(
                    controllerText: _controllerText,
                    focus: _locationFocus,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


