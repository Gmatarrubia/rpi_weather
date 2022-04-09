import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpi_weather/resources/ui_constants.dart';
import 'package:virtual_keyboard_2/virtual_keyboard_2.dart';
import 'package:rpi_weather/providers/system_provider.dart';

class Keyboard extends StatefulWidget {
  final TextEditingController controllerText;
  final FocusNode focus;
  const Keyboard({required this.controllerText, required this.focus, Key? key})
      : super(key: key);

  @override
  State<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  bool? showKeyboard = false;
  @override
  void initState() {
    widget.focus.addListener(_onFocusChange);
    super.initState();
  }

  void _onFocusChange() {
    setState(() {
      showKeyboard = widget.focus.hasFocus;
    });
  }

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
