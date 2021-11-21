import 'package:flutter/material.dart';
import 'package:one_on_one_learning/routes.dart';
import 'package:one_on_one_learning/screen/home/home_screen.dart';
import 'package:one_on_one_learning/screen/splash/splash_screen.dart';
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
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
