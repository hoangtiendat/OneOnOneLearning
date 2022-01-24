import 'package:flutter/material.dart';

import '../../utility/size_config.dart';
import 'components/body.dart';

class ConferenceScreen extends StatelessWidget {
  const ConferenceScreen({Key? key}) : super(key: key);
  static String routeName = "/conference";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: const Body(),
      appBar: AppBar(
        title: const Text("Conference"),
      ),
    );
  }
}
