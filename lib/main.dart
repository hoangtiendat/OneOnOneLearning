import 'package:flutter/material.dart';
import 'package:one_on_one_learning/routes.dart';
import 'package:one_on_one_learning/screen/conference/conference_screen.dart';
import 'package:one_on_one_learning/screen/home/home_screen.dart';
import 'package:one_on_one_learning/screen/register_tutor/register_tutor_screen.dart';
import 'package:one_on_one_learning/screen/schedule/schedule_screen.dart';
import 'package:one_on_one_learning/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'One On One Learning App',
      theme: theme(),
      initialRoute: RegisterTutorScreen.routeName,
      routes: routes,
    );
  }
}
