import 'package:flutter/material.dart';
import 'package:one_on_one_learning/utility/size_config.dart';

import 'constants.dart';

class ThemeChanger extends ChangeNotifier {
  bool isLight = true;
  ThemeData _themeData = themeCustom();

  getTheme() => _themeData;

  bool getIsLight() => isLight;

  void setTheme(bool isLightValue) {
    _themeData = isLightValue ? themeCustom() : themeDarkCustom();
    isLight = isLightValue;
    notifyListeners();
  }
}

ThemeData themeDarkCustom() {
  return ThemeData(
    scaffoldBackgroundColor: ThemeData.dark().scaffoldBackgroundColor,
    colorScheme: ThemeData.dark().colorScheme,
    appBarTheme: ThemeData.dark().appBarTheme,
    textTheme: textTheme(false),
    inputDecorationTheme: inputDecorationTheme(false),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

ThemeData themeCustom() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(true),
    inputDecorationTheme: inputDecorationTheme(true),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme(bool isLight) {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: isLight ? kTextColor : Colors.white),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    labelStyle: const TextStyle(
      fontSize: 20,
    ),
    hintStyle: const TextStyle(
      fontSize: 15,
    ),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme(bool isLight) {
  return TextTheme(
    bodyText1: TextStyle(
      color: isLight ? kTextColor : Colors.white,
      fontSize: getProportionateScreenWidth(15),
    ),
    bodyText2: TextStyle(
      color: isLight ? kTextColor : Colors.white,
      fontSize: getProportionateScreenWidth(15),
    ),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
  );
}
