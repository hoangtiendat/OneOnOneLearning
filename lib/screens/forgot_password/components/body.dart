import 'package:flutter/material.dart';
import 'package:one_on_one_learning/components/default_button.dart';
import 'package:one_on_one_learning/components/no_account_text.dart';
import 'package:one_on_one_learning/provider/auth.dart';
import 'package:one_on_one_learning/screens/sign_in/sign_in_screen.dart';
import 'package:provider/provider.dart';

import '../../../utility/constants.dart';
import '../../../utility/size_config.dart';

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
  String? email;
  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    void sendEmail() {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();

        final Future<Map<String, dynamic>> respose =
            auth.forgotPassWord(email!);

        respose.then((response) {
          if (response['status']) {
            showMyDialog("Success:", "Email send success!", () {
              Navigator.popAndPushNamed(context, SignInScreen.routeName);
            }, context);
          } else {
            showMyDialog(
                "Error:", response['message'].toString(), null, context);
          }
        });
      } else {
        const SnackBar(
          content: Text("Invalid form: Please complete the form properly"),
          duration: Duration(seconds: 10),
        );
      }
    }

    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CircularProgressIndicator(),
        Text(" Sending ... Please wait")
      ],
    );
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            onSaved: (newValue) => email = newValue,
            onChanged: (newValue) => email = newValue,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return kEmailNullError;
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                return kInvalidEmailError;
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
          SizedBox(
            height: SizeConfig.screenHeight! * 0.1,
          ),
          auth.registeredInStatus == Status.registering
              ? loading
              : DefaultButton(
                  text: "Send",
                  press: sendEmail,
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
