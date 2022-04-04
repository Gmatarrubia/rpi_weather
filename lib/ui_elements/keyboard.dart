import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpi_weather/resources/ui_constants.dart';
import 'package:virtual_keyboard_2/virtual_keyboard_2.dart';
import 'package:rpi_weather/providers/system_provider.dart';

class Keyboard extends StatefulWidget {
  final TextEditingController controllerText;
  const Keyboard({required this.controllerText, Key? key}) : super(key: key);

  @override
  State<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SystemProvider>(builder: (context, systemProvider, child) {
      bool? onEditState = systemProvider.systemModel.getEnableEditState();
      return Visibility(
        visible: onEditState!,
        child: Container(
          color: Colors.grey,
          height: 350.0,
          child: VirtualKeyboard(
            type: VirtualKeyboardType.Alphanumeric,
            textController: widget.controllerText,
          ),
        ),
      );
    });
  }
}
