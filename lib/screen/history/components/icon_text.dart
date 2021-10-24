import 'package:flutter/material.dart';

import '../../../size_config.dart';

class IconText extends StatelessWidget {
  const IconText({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: getProportionateScreenWidth(20),
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(15),
          ),
        ),
      ],
    );
  }
}
