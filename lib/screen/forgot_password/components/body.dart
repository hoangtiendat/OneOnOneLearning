import 'package:flutter/material.dart';
import 'package:one_on_one_learning/components/default_button.dart';
import 'package:one_on_one_learning/components/form_error.dart';
import 'package:one_on_one_learning/components/no_account_text.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight! * 0.04,
              ),
              Image.asset(
                "assets/images/logo.png",
                height: getProportionateScreenHeight(135),
                width: getProportionateScreenWidth(125),
              ),
              Text(
                "LET TUTOR",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.04,
              ),
              Text(
                "Enter you email address and we'll\nsend you a link to reset your password",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight! * 0.1,
              ),
              const ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key}) : super(key: key);

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String? email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                setState(() {
                  errors.remove(kEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
            },
            validator: (value) {
              if (value!.isEmpty && !errors.contains(kEmailNullError)) {
                setState(() {
                  errors.add(kEmailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
              }
            },
            decoration: const InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          FormError(errors: errors),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.1,
          ),
          DefaultButton(
            text: "Send",
            press: () {
              if (_formKey.currentState!.validate()) {}
            },
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.1,
          ),
          const NoAccountText(),
        ],
      ),
    );
  }
}
