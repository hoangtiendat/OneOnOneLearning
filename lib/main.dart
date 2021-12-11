import 'package:flutter/material.dart';
import 'package:one_on_one_learning/models/booking.dart';
import 'package:one_on_one_learning/models/courses.dart';
import 'package:one_on_one_learning/models/tutor.dart';
import 'package:one_on_one_learning/routes.dart';
import 'package:one_on_one_learning/screens/home/home_screen.dart';
import 'package:one_on_one_learning/screens/splash/splash_screen.dart';
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
        ChangeNotifierProvider<AppointmentProvider>(
          create: (_) => AppointmentProvider()..getAppointments(),
        ),
        ChangeNotifierProvider<ThemeChanger>(
          create: (_) => ThemeChanger(ThemeData.light()),
        ),
      ],
      child: const MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  const MaterialAppWithTheme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'One On One Learning App',
      theme: theme.getTheme(),
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
