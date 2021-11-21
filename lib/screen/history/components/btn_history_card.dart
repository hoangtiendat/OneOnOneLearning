import 'package:flutter/material.dart';

import '../../../size_config.dart';

class BtnHistoryCard extends StatelessWidget {
  const BtnHistoryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: getProportionateScreenWidth(130),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.white,
                side: const BorderSide(color: Colors.blue),
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.all(0),
              ),
              onPressed: () {},
              child: Text(
                " Give Feedback ",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(15),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(130),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.blue,
                side: const BorderSide(color: Colors.blueAccent),
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(0),
              ),
              onPressed: () {},
              child: Text(
                " Go to Meeting ",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(15),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
