import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpi_weather/resources/ui_constants.dart';
import 'package:rpi_weather/providers/system_provider.dart';

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
  bool? isEditing = false;
  @override
  void initState() {
    widget.textFocus.addListener(_onFocusChange);
    super.initState();
  }

  void _onFocusChange() {
    setState(() {
      isEditing = widget.textFocus.hasFocus;
    });
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
                Consumer<SystemProvider>(
                    builder: (context, systemProvider, child) {
                  return SizedBox(
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
                          systemProvider.setLocation(text);
                          if (Provider.of<SystemProvider>(context,
                                      listen: false)
                                  .getEditState() ==
                              true) {
                            systemProvider.changeEditState();
                          }
                        });
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
          Consumer<SystemProvider>(builder: (context, systemProvider, child) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: const CircleBorder(side: BorderSide()),
              ),
              onPressed: () {
                setState(() {
                  systemProvider.changeEditState();
                  if (systemProvider.getEditState() == true) {
                    FocusScope.of(context).requestFocus(widget.textFocus);
                  }
                  else {
                    systemProvider.setLocation(widget.controllerText.text);
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Icon(
                  isEditing! ? Icons.done : Icons.edit,
                  size: 40.0,
                  color: isEditing! ? const Color(0xFF0B3D66) : Colors.black,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
