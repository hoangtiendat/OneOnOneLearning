import 'package:flutter/material.dart';
import 'package:one_on_one_learning/size_config.dart';

class SettingMenu extends StatelessWidget {
  const SettingMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          shadowColor: Colors.grey,
          elevation: 5,
          primary: Colors.white,
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(50)),
            side: const BorderSide(color: Colors.blue),
          ),
        ),
        onPressed: press,
        child: Row(
          children: [
            Icon(
              icon,
              size: getProportionateScreenWidth(30),
            ),
            SizedBox(width: getProportionateScreenWidth(10)),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(20),
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: getProportionateScreenWidth(30),
            ),
          ],
        ),
      ),
    );
  }
}
