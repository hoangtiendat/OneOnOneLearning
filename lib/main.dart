import 'package:flutter/material.dart';
import 'package:one_on_one_learning/models/courses.dart';
import 'package:one_on_one_learning/models/tutor.dart';
import 'package:one_on_one_learning/routes.dart';
import 'package:one_on_one_learning/screen/home/home_screen.dart';
import 'package:one_on_one_learning/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TutorProvider>(
          create: (_) => TutorProvider()..getTutors(),
        ),
        ChangeNotifierProvider<CourseProvider>(
          create: (_) => CourseProvider()..getCourses(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'One On One Learning App',
        theme: theme(),
        initialRoute: HomeScreen.routeName,
        routes: routes,
      ),
    );
  }
}
