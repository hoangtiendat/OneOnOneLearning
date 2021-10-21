import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'components/body.dart';

class TutorsScreen extends StatelessWidget {
  const TutorsScreen({ Key? key }) : super(key: key);
  static String routeName = "/tutors_screen";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}