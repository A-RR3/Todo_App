import 'package:flutter/material.dart';
import 'package:training_task1/core/values/constants.dart';

class MyMaterialBotton extends StatelessWidget {
  const MyMaterialBotton(
      {super.key,
      this.bottonColor,
      required this.onPress,
      required this.text,
      required this.textColor});
  final Color? bottonColor;
  final Color textColor;
  final VoidCallback onPress;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          textColor: textColor,
          color: bottonColor,
          onPressed: onPress,
          child: Text(
            text,
            style: textTheme(14, null, null),
          )),
    );
  }
}
