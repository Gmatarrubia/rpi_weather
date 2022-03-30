import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Text(
          "Madrid",
        ),
      ],

    );
  }
}