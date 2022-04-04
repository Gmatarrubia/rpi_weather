import 'package:flutter/material.dart';
import 'package:rpi_weather/resources/ui_constants.dart';
import 'package:provider/provider.dart';
import 'package:rpi_weather/ui_elements/top_bar.dart';
import 'package:rpi_weather/ui_elements/time_widget.dart';
import 'package:rpi_weather/ui_elements/basic_weather.dart';
import 'package:rpi_weather/ui_elements/info_weather.dart';
import 'package:rpi_weather/ui_elements/keyboard.dart';
import 'package:rpi_weather/providers/system_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  late TextEditingController _controllerText;

  @override
  void initState() {
    _controllerText = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SystemProvider>(
      create: (context) => SystemProvider(),
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
                      ),
                    ),
                    const Flexible(
                        flex: 1, fit: FlexFit.tight, child: TimeWidget()),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const <Widget>[
                          Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: BasicWeather()),
                          VerticalDivider(
                            color: kTextColor,
                            thickness: 2,
                            indent: 25,
                            endIndent: 25,
                          ),
                          Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: InfoWeather()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Keyboard(
                    controllerText: _controllerText,
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
