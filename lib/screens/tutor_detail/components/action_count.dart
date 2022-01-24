import 'package:flutter/material.dart';

import '../../../utility/size_config.dart';

class ActionCount extends StatelessWidget {
  const ActionCount({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.blue,
          size: getProportionateScreenWidth(20),
        ),
        Text(
          text,
          style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(14)),
        ),
      ],
    );
  }
}
