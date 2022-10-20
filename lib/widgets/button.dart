import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

typedef funcOnPress = void Function(String text);

class Button extends StatelessWidget {
  final String text;
  final Color colorButton;
  final Color colorText;

  final funcOnPress? onPressed;

  Button(this.text, this.colorButton, this.colorText, this.onPressed)
      : super(key: Key(text));

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: ElevatedButton(
          child: Padding(
            padding: text == "0"
                ? const EdgeInsets.only(
                    left: 0, top: 20, right: 120, bottom: 20)
                : text.length == 1
                    ? const EdgeInsets.all(0)
                    : const EdgeInsets.symmetric(horizontal: 0, vertical: 22),
            child: mapIcon.containsKey(text)
                ? Icon(
                    mapIcon[text],
                    size: 30,
                  )
                : Text(
                    text,
                    style: const TextStyle(fontSize: 30),
                  ),
          ),
          onPressed: () {
            onPressed!(text);
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: colorText,
            backgroundColor: colorButton,
            shape: text == "0" ? const StadiumBorder() : const CircleBorder(),
          ),
        ));
  }
}
