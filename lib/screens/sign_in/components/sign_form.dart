import 'package:flutter/material.dart';
import 'package:one_on_one_learning/components/dialog_loading.dart';
import 'package:one_on_one_learning/screens/forgot_password/forgot_password_screen.dart';
import 'package:one_on_one_learning/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool? remember = false;

  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void initState() {
    super.initState();
    getSharedPreferences();
  }

  Future<void> getSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final storedEmail = prefs.getString("email") ?? "";
    final storedPassword = prefs.getString("password") ?? "";

    setState(() {
      emailController = TextEditingController(text: storedEmail);
      passwordController = TextEditingController(text: storedPassword);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenWidth(20)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenWidth(20)),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => Navigator.popAndPushNamed(
                  context, ForgotPasswordScreen.routeName),
              child: const Text(
                "Forgot Password",
                style: TextStyle(color: kPrimaryColor),
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          SizedBox(height: getProportionateScreenWidth(20)),
          DefaultButton(
            text: "Log In",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }

              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return const DialogLoading();
                },
              );
              Future.delayed(const Duration(seconds: 1), () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setString("email", email);
                prefs.setString("password", password);
                Navigator.popAndPushNamed(context, HomeScreen.routeName);
              });
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.isEmpty) {
          return kPassNullError;
        } else if (value.length < 8) {
          return kShortPassError;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "* * * * * * * *",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.isEmpty) {
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "example@email.com",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
