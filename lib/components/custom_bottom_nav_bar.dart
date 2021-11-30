import 'package:flutter/material.dart';
import 'package:one_on_one_learning/screen/home/home_screen.dart';
import 'package:one_on_one_learning/screen/schedule/schedule_screen.dart';
import 'package:one_on_one_learning/screen/setting/setting_screen.dart';
import 'package:one_on_one_learning/screen/tutors/tutors_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({
    Key? key,
    required this.indexSelected,
  }) : super(key: key);

  final int indexSelected;

  final List<String> lsRoute = [
    HomeScreen.routeName,
    HomeScreen.routeName,
    ScheduleScreen.routeName,
    TutorsScreen.routeName,
    SettingScreen.routeName
  ];

  @override
  Widget build(BuildContext context) {
    // const Color inActiveIconColor = Color(0xFFB6B6B6);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message_rounded),
          label: 'Message',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.upcoming_rounded),
          label: 'Upcoming',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervisor_account),
          label: 'Tutors',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      currentIndex: indexSelected,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: (indexSelected) =>
          Navigator.popAndPushNamed(context, lsRoute[indexSelected]),
      iconSize: 25,
      selectedFontSize: 16,
      unselectedFontSize: 14,
    );
  }
}
