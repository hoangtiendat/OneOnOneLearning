import 'package:flutter/material.dart';
import 'package:one_on_one_learning/components/default_button.dart';
import 'package:one_on_one_learning/provider/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String conformPassword = "";

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    void doRegister() {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();

        final Future<Map<String, dynamic>> respose =
            auth.register(email, password);

        respose.then((response) {
          if (response['status']) {
            showMyDialog("Success:", "Verify your email address", () {
              Navigator.pop(context);
              Navigator.pop(context);
            }, context);
          } else {
            // var snackBar = SnackBar(
            //   content: Text(response['message'].toString()),
            //   duration: const Duration(seconds: 10),
            // );
            // ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
        Text(" Registering ... Please wait")
      ],
    );

    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              buildEmailFormField(),
              SizedBox(height: getProportionateScreenWidth(20)),
              buildPasswordFormField(),
              SizedBox(height: getProportionateScreenWidth(20)),
              buildConformPassFormField(),
              SizedBox(height: getProportionateScreenWidth(30)),
            ],
          ),
        ),
        auth.registeredInStatus == Status.registering
            ? loading
            : DefaultButton(
                text: "Register",
                press: doRegister,
              ),
      ],
    );
  }

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conformPassword = newValue!,
      onChanged: (newValue) => conformPassword = newValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.isEmpty) {
          return kPassNullError;
        } else if ((password != value)) {
          return kMatchPassError;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Confirm password",
        hintText: "* * * * * * * *",
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (newValue) => password = newValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.isEmpty) {
          return kPassNullError;
        } else if (value.length < 5) {
          return kShortPassError;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "* * * * * * * *",
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => email = newValue!,
      onChanged: (newValue) => email = newValue,
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
      ),
    );
  }
}
