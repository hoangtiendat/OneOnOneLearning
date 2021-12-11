import 'package:flutter/material.dart';
import 'package:one_on_one_learning/size_config.dart';

import 'constants.dart';

class ThemeChanger extends ChangeNotifier {
  ThemeData _themeData;
  ThemeChanger(this._themeData);
  getTheme() => _themeData;

  void setTheme(ThemeData theme) {
    _themeData = theme == ThemeData.light() ? themeCustom() : theme;

    notifyListeners();
  }
}

ThemeData themeCustom() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Nunito",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: kTextColor),
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

TextTheme textTheme() {
  return TextTheme(
    bodyText1: TextStyle(
      color: kTextColor,
      fontSize: getProportionateScreenWidth(15),
    ),
    bodyText2: TextStyle(
      color: kTextColor,
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
