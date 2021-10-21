import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class TutorDetailScreen extends StatelessWidget {
  const TutorDetailScreen({ Key? key }) : super(key: key);

  static String routeName = "/tutor_detail_screen";
  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Body(),
    );
  }
}