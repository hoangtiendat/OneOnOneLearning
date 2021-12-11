import 'package:flutter/material.dart';
import 'package:one_on_one_learning/constants.dart';

import '../../../size_config.dart';

class FromToTime extends StatelessWidget {
  const FromToTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(40),
          height: getProportionateScreenHeight(20),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Colors.blue,
              side: const BorderSide(color: Colors.blue),
              backgroundColor: Colors.blue[100],
              padding: const EdgeInsets.all(0),
            ),
            onPressed: () {},
            child: Text(
              "20:00",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(10),
              ),
            ),
          ),
        ),
        Icon(
          Icons.arrow_forward_rounded,
          size: getProportionateScreenHeight(18),
          color: kTextColor,
        ),
        SizedBox(
          width: getProportionateScreenWidth(40),
          height: getProportionateScreenHeight(20),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Colors.orange,
              side: const BorderSide(color: Colors.orange),
              backgroundColor: Colors.orange[100],
              padding: const EdgeInsets.all(0),
            ),
            onPressed: () {},
            child: Text(
              "22:00",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
