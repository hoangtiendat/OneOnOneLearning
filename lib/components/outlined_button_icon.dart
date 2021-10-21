import 'package:flutter/material.dart';

class OutlinedButtonIcon extends StatelessWidget {
  const OutlinedButtonIcon({
    Key? key, required this.text, required this.press, required this.icon,
  }) : super(key: key);
  final String text;
  final Icon icon;
  final VoidCallback press;
  
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      label: Text(text),
      icon: icon,
      style: OutlinedButton.styleFrom(
        primary: Colors.blue,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        side: const BorderSide(color: Colors.blue),
      ),
      onPressed: press,
    );
  }
}