import 'package:flutter/material.dart';
import 'package:one_on_one_learning/models/tutor.dart';

import '../../size_config.dart';
import 'components/body.dart';

class TutorDetailScreen extends StatelessWidget {
  const TutorDetailScreen({Key? key}) : super(key: key);

  static String routeName = "/tutor_detail_screen";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tutor detail"),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.of(
              context,
              rootNavigator: false,
            ).pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
        ),
      ),
      body: const Body(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: FloatingActionButton(
      //     elevation: 0,
      //     backgroundColor: Colors.grey.withOpacity(0.6),
      //     child: Icon(
      //       Icons.arrow_back_ios_new_rounded,
      //       color: Colors.blue,
      //       size: getProportionateScreenWidth(35),
      //     ),
      //     onPressed: () =>
      //         // Navigator.pushNamed(context, TutorsScreen.routeName),
      //         Navigator.of(context).pop(),
      //   ),
      // ),
    );
  }
}
