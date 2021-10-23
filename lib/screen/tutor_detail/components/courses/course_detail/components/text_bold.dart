import 'package:flutter/material.dart';
import 'package:one_on_one_learning/constants.dart';
import 'package:one_on_one_learning/size_config.dart';

class TextBold extends StatelessWidget {
  const TextBold({
    Key? key,
    required this.text,
    this.color = kSecondaryColor,
  }) : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: getProportionateScreenWidth(25),
        height: getProportionateScreenWidth(1),
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
