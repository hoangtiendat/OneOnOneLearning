import 'package:flutter/material.dart';
import 'package:one_on_one_learning/screen/tutor_detail/tutor_detail.dart';

import '../../size_config.dart';
import 'components/body.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({ Key? key }) : super(key: key);
  static String routeName = "/booking_screen";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking"),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.popAndPushNamed(context, TutorDetailScreen.routeName);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
        ),
      ),
      body: const Body(),
    );
  }
}