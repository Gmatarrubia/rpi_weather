import 'package:flutter/material.dart';
import 'package:rpi_weather/resources/ui_constants.dart';
import 'package:rpi_weather/models/system_model.dart';

class TopBar extends StatefulWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  SystemModel model = SystemModel();
  bool enableEditionState = false;
  late TextEditingController _controllerText;

  @override
  void initState() {
    _controllerText = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxStyle.copyWith(
        color: Colors.lightBlueAccent.withAlpha(kBoxBackgroundAlpha),
      ),
      margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: <Widget>[
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on,
                  size: 40.0,
                  color: kTextColor,
                ),
                SizedBox(
                  width: 180,
                  child: TextField(
                    controller: _controllerText,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Hey",
                    ),
                    style: kLocationStyle,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            onPressed: () {
              setState(() {
                enableEditionState
                    ? enableEditionState = false
                    : enableEditionState = true;
              });
            },
            child: Icon(
              Icons.edit,
              size: 40.0,
              color: enableEditionState ? Colors.amberAccent : Colors.black,
            ),
          )
        ],
      ),
    );
  }

  TextEditingController? getTextController() {
    return _controllerText;
  }
}
