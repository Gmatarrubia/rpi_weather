import 'package:flutter/material.dart';
import 'package:rpi_weather/ui_elements/top_bar.dart';
import 'package:rpi_weather/ui_elements/time_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TopBar(),
            TimeWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Icono"),
                Text("Separador"),
                Text("Datos secundarios"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
