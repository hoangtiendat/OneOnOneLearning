import 'package:flutter/material.dart';
import 'package:one_on_one_learning/screen/course/course_screen.dart';
import 'package:one_on_one_learning/screen/home/home_screen.dart';
import 'package:one_on_one_learning/screen/schedule/schedule_screen.dart';
import 'package:one_on_one_learning/screen/settings/setting_screen.dart';
import 'package:one_on_one_learning/screen/tutors/tutors_screen.dart';
import 'package:one_on_one_learning/size_config.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({
    Key? key,
    required this.indexSelected,
  }) : super(key: key);

  final int indexSelected;

  final List<String> lsRoute = [
    HomeScreen.routeName,
    CourseScreen.routeName,
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
          icon: Icon(Icons.book),
          label: 'Courses',
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
      onTap: (indexSelected) {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return Dialog(
              backgroundColor: Colors.white.withOpacity(0.8),
              child: Container(
                width: getProportionateScreenHeight(40),
                height: getProportionateScreenWidth(80),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: getProportionateScreenWidth(20),
                    ),
                    const CircularProgressIndicator(),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text(
                      "Loading ...",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(25),
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pop(context);
          Navigator.popAndPushNamed(context, lsRoute[indexSelected]);
        });
      },
      iconSize: 25,
      selectedFontSize: 16,
      unselectedFontSize: 14,
    );
  }
}
