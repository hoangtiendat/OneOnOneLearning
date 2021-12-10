import 'package:flutter/material.dart';

import '../size_config.dart';

class DialogLoading extends StatelessWidget {
  const DialogLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white.withOpacity(0.8),
      child: SizedBox(
        width: getProportionateScreenHeight(40),
        height: getProportionateScreenWidth(80),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: getProportionateScreenWidth(20),
            ),
            const CircularProgressIndicator(),
            SizedBox(
              width: getProportionateScreenWidth(10),
            ),
            Text(
              "Loading ...",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(25),
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
