import 'package:flutter/material.dart';

import '../size_config.dart';

class OutlinedButtonNoIcon extends StatelessWidget {
  const OutlinedButtonNoIcon({
    Key? key, required this.text, required this.press,
  }) : super(key: key);
  final String text;
  final VoidCallback press;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.blue,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          side: const BorderSide(color: Colors.blue),
          backgroundColor: Colors.blue[100],
          padding: const EdgeInsets.all(4),
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