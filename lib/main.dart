import 'package:flutter/material.dart';
import 'package:one_on_one_learning/models/user_token.dart';
import 'package:one_on_one_learning/provider/auth_provider.dart';
import 'package:one_on_one_learning/provider/tutor.dart';
import 'package:one_on_one_learning/provider/user_token_provider.dart';

import 'package:one_on_one_learning/routes.dart';
import 'package:one_on_one_learning/screens/home/home_screen.dart';
import 'package:one_on_one_learning/screens/sign_in/sign_in_screen.dart';
import 'package:one_on_one_learning/theme.dart';
import 'package:one_on_one_learning/utility/shared_preference.dart';
import 'package:provider/provider.dart';

import 'models/booking.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider<TutorProvider>(
        //   create: (_) => TutorProvider(),
        // ),
        // ChangeNotifierProvider<CourseProvider>(
        //   create: (_) => CourseProvider()..getCourses(),
        // ),
        ChangeNotifierProvider<AppointmentProvider>(
          create: (_) => AppointmentProvider()..getAppointments(),
        ),
        ChangeNotifierProvider<ThemeChanger>(
          create: (_) => ThemeChanger(),
        ),
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<UserTokenProvider>(
            create: (_) => UserTokenProvider()),
        ChangeNotifierProvider<TutorProvider>(
          create: (_) => TutorProvider(),
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
    Future<UserToken> getUserData() => UserPreferences().getUserToken();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'One On One Learning App',
      theme: theme.getTheme(),
      // initialRoute: SignInScreen.routeName,
      home: FutureBuilder<UserToken>(
          future: getUserData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const CircularProgressIndicator();
              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.data!.tokens == null) {
                  return const SignInScreen();
                } else {
                  Provider.of<UserTokenProvider>(context)
                      .setUserToken(snapshot.data as UserToken);
                  return const HomeScreen();
                }
            }
          }),
      routes: routes,
    );
  }
}
