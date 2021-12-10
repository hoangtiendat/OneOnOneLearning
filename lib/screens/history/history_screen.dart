import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'components/body.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  static String routeName = "/history_screen";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Session History"),
      ),
      body: const Body(),
    );
  }
}
