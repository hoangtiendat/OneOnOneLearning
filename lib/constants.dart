import 'package:flutter/material.dart';

import 'size_config.dart';

const kPrimaryColor = Color.fromRGBO(102, 153, 255, 1);
const kPrimaryLightColor = Color.fromRGBO(179, 204, 255, 1);

const kSecondaryColor = Color.fromRGBO(151, 151, 151, 1);
const kTextColor = Color.fromRGBO(117, 117, 117, 1);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: kPrimaryColor,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

//Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.+]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kFullNameError = "Please enter full name";
const String kEmailNullError = "Please enter your email";
const String kInvalidEmailError = "Please enter Valid Email";
const String kPassNullError = "Please enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please enter your name";
const String kPhoneNumberNullError = "Please enter your phone number";
const String kAddressNullError = "Please enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: const BorderSide(color: kTextColor),
  );
}

double? checkDouble(dynamic value) {
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

const String urlApi = "https://sandbox.api.lettutor.com";

Future<void> showMyDialog(String title, String content, VoidCallback? direct,
    BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(content),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: direct ??
                () {
                  Navigator.of(context).pop();
                },
          ),
        ],
      );
    },
  );
}
