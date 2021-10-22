import 'package:flutter/material.dart';

import '../size_config.dart';

class TitleBlueBold extends StatelessWidget {
  const TitleBlueBold({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: getProportionateScreenWidth(18),
        color: Colors.blue,
      ),
    );
  }
}
