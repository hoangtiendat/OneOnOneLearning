import 'package:flutter/material.dart';
import 'package:one_on_one_learning/components/form_error.dart';
import 'package:one_on_one_learning/screen/forgot_password/forgot_password_screen.dart';
import 'package:one_on_one_learning/screen/home/home_screen.dart';
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
  final List<String> errors = [];

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

  void addError({required String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({required String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
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
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Log In",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
              }
              final prefs = await SharedPreferences.getInstance();
              prefs.setString("email", email);
              prefs.setString("password", password);
              Navigator.popAndPushNamed(context, HomeScreen.routeName);
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
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
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
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
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
