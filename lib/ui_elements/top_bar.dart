import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpi_weather/resources/ui_constants.dart';
import 'package:rpi_weather/models/system_model.dart';

import '../providers/system_provider.dart';

class TopBar extends StatefulWidget {
  final TextEditingController controllerText;
  final FocusNode textFocus;
  const TopBar(
      {required this.controllerText, required this.textFocus, Key? key})
      : super(key: key);
  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
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
                  width: 350,
                  child: TextField(
                    controller: widget.controllerText,
                    focusNode: widget.textFocus,
                    style: kLocationStyle,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "",
                    ),
                    onSubmitted: (String text) {
                      setState(() {
                        Provider.of<SystemProvider>(context, listen: false)
                            .changeEditState();
                      });
                    },
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
                Provider.of<SystemProvider>(context, listen: false)
                    .changeEditState();
                if (Provider.of<SystemProvider>(context, listen: false)
                        .getEditState() == true) {
                  FocusScope.of(context).requestFocus(widget.textFocus);
                }
              });
            },
            child: Consumer<SystemProvider>(
              builder: (context, systemProvider, child) {
                bool? enableEditionState =
                    systemProvider.systemModel.getEnableEditState();
                return Icon(
                  Icons.edit,
                  size: 40.0,
                  color:
                      enableEditionState! ? Colors.amberAccent : Colors.black,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
