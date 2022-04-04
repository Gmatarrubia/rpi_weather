import 'package:flutter/material.dart';
import 'package:rpi_weather/resources/ui_constants.dart';
import 'package:virtual_keyboard_2/virtual_keyboard_2.dart';

class Keyboard extends StatefulWidget {
  const Keyboard({ Key? key }) : super(key: key);

  @override
  State<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  TextEditingController myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: false,
      child: Container(
        color: Colors.grey,
        height: 350.0,
        child: VirtualKeyboard(
          type: VirtualKeyboardType.Alphanumeric,
          textController: myController,
        ),
      ),
    );
  }
}