import 'package:flutter/material.dart';

import '../size_config.dart';

class OutlinedButtonNoIconV2 extends StatelessWidget {
  const OutlinedButtonNoIconV2({
    Key? key,
    required this.text,
    required this.press,
    required this.isSelected,
  }) : super(key: key);
  final String text;
  final VoidCallback press;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 1, 4, 10),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.blue,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          side: const BorderSide(color: Colors.blue),
          backgroundColor: isSelected ? Colors.blue[100] : Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        ),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(15),
          ),
        ),
      ),
    );
  }
}
