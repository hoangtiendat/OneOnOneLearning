import 'package:flutter/material.dart';
import 'package:one_on_one_learning/screen/booking/booking_screen.dart';
import 'package:one_on_one_learning/screen/forgot_password/forgot_password_screen.dart';
import 'package:one_on_one_learning/screen/history/history_screen.dart';
import 'package:one_on_one_learning/screen/schedule/schedule_screen.dart';
import 'package:one_on_one_learning/screen/sign_in/sign_in_screen.dart';
import 'package:one_on_one_learning/screen/sign_up/sign_up_screen.dart';
import 'package:one_on_one_learning/screen/splash/splash_screen.dart';
import 'package:one_on_one_learning/screen/tutor_detail/tutor_detail.dart';
import 'package:one_on_one_learning/screen/tutors/tutors_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  TutorsScreen.routeName: (context) => const TutorsScreen(),
  TutorDetailScreen.routeName: (context) => const TutorDetailScreen(),
  BookingScreen.routeName: (context) => const BookingScreen(),
  ScheduleScreen.routeName: (context) => const ScheduleScreen(),
  HistoryScreen.routeName: (context) => const HistoryScreen(),

};