import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rpi_weather/resources/ui_constants.dart';
import 'package:rpi_weather/services/time_service.dart';

class TimeWidget extends StatefulWidget {
  TimeWidget({Key? key}) : super(key: key);

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  final TimeService _timeService = TimeService();
  late Future<DateTime> _currentTime;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _currentTime = _timeService.getCurrentTime();
    _timer = Timer.periodic(const Duration(seconds: 1), updateTime);
  }

  void updateTime(Timer timer) {
    setState(() {
      _currentTime = _timeService.getCurrentTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxStyle.copyWith(
          color: Colors.deepOrangeAccent.withAlpha(kBoxBackgroundAlpha)),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Text(
              "$_currentTime",
              style: kClockStyle,
              textAlign: TextAlign.center,
            ),
          ),
          const Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Text(
              "Jueves 24 de Abril de 2022",
              style: kDateStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
