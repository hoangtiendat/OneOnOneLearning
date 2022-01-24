import 'package:flutter/material.dart';
import 'package:one_on_one_learning/screens/booking/booking_screen.dart';
import 'package:one_on_one_learning/screens/conference/conference_screen.dart';
import 'package:one_on_one_learning/screens/course/course_screen.dart';
import 'package:one_on_one_learning/screens/course_detail/course_detail_screen.dart';
import 'package:one_on_one_learning/screens/forgot_password/forgot_password_screen.dart';
import 'package:one_on_one_learning/screens/history/history_screen.dart';
import 'package:one_on_one_learning/screens/home/home_screen.dart';
import 'package:one_on_one_learning/screens/register_tutor/register_tutor_screen.dart';
import 'package:one_on_one_learning/screens/settings/setting_screen.dart';
import 'package:one_on_one_learning/screens/schedule/schedule_screen.dart';
import 'package:one_on_one_learning/screens/sign_in/sign_in_screen.dart';
import 'package:one_on_one_learning/screens/sign_up/sign_up_screen.dart';
import 'package:one_on_one_learning/screens/splash/splash_screen.dart';
import 'package:one_on_one_learning/screens/tutor_detail/tutor_detail.dart';
import 'package:one_on_one_learning/screens/tutors/tutors_screen.dart';

import '../screens/profile/profile_screen.dart';

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
  CourseDetailScreen.routeName: (context) => const CourseDetailScreen(),
  SettingScreen.routeName: (context) => const SettingScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ConferenceScreen.routeName: (context) => const ConferenceScreen(),
  RegisterTutorScreen.routeName: (context) => const RegisterTutorScreen(),
  CourseScreen.routeName: (context) => const CourseScreen(),
};
