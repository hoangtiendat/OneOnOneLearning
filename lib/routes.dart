import 'package:flutter/material.dart';
import 'package:one_on_one_learning/models/tutor.dart';
import 'package:one_on_one_learning/screen/booking/booking_screen.dart';
import 'package:one_on_one_learning/screen/conference/conference_screen.dart';
import 'package:one_on_one_learning/screen/forgot_password/forgot_password_screen.dart';
import 'package:one_on_one_learning/screen/history/history_screen.dart';
import 'package:one_on_one_learning/screen/home/home_screen.dart';
import 'package:one_on_one_learning/screen/register_tutor/register_tutor_screen.dart';
import 'package:one_on_one_learning/screen/setting/setting_screen.dart';
import 'package:one_on_one_learning/screen/schedule/schedule_screen.dart';
import 'package:one_on_one_learning/screen/sign_in/sign_in_screen.dart';
import 'package:one_on_one_learning/screen/sign_up/sign_up_screen.dart';
import 'package:one_on_one_learning/screen/splash/splash_screen.dart';
import 'package:one_on_one_learning/screen/tutor_detail/components/courses/course_detail/course_detail_screen.dart';
import 'package:one_on_one_learning/screen/tutor_detail/tutor_detail.dart';
import 'package:one_on_one_learning/screen/tutors/tutors_screen.dart';

import 'screen/profile/profile_screen.dart';

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
};
