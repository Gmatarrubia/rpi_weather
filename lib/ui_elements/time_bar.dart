import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rpi_weather/resources/ui_constants.dart';
import 'package:rpi_weather/services/time_service.dart';
import 'package:rpi_weather/providers/system_provider.dart';
import 'package:provider/provider.dart';

class TimeBar extends StatefulWidget {
  const TimeBar({Key? key}) : super(key: key);

  @override
  State<TimeBar> createState() => _TimeBarState();
}

class _TimeBarState extends State<TimeBar> {
  final TimeService _timeService = TimeService();
  String _clock = "";
  String _date = "";

  // ignore: unused_field
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), updateTime);
  }

  void updateTime(Timer timer) async {
    Duration? timezone = Duration(
      milliseconds: Provider.of<SystemProvider>(context, listen: false).getTimeZone()!);
    _clock = await _timeService.getCurrentHour(timezone: timezone);
    _date = await _timeService.getCurrentDate(timezone: timezone);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxStyle.copyWith(
          color: Color.fromARGB(255, 247, 227, 150)
              .withAlpha(kBoxBackgroundAlpha)),
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Text(
              _clock,
              style: kClockStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Text(
              _date,
              style: kDateStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
