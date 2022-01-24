import 'package:flutter/material.dart';
import 'package:one_on_one_learning/provider/auth.dart';
import 'package:one_on_one_learning/screens/forgot_password/forgot_password_screen.dart';
import 'package:one_on_one_learning/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/default_button.dart';
import '../../../utility/constants.dart';
import '../../../utility/size_config.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

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

  // Future<void> pressLogin() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return const DialogLoading();
  //     },
  //   );
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();
  //   }

  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString("email", email);
  //   prefs.setString("password", password);

  //   var url = Uri.parse('$url_api/auth/login');
  //   var response =
  //       await http.post(url, body: {'email': email, 'password': password});
  //   if (response.statusCode == 200) {
  //     var userToken = UserToken.fromJson(jsonDecode(response.body));
  //     Auth.setToken(
  //         userToken.tokens.access.token, userToken.tokens.refresh.token);
  //     setState(() {
  //       isLoading = true;
  //       loginState = 1;
  //     });
  //     Navigator.pop(context);
  //     Navigator.popAndPushNamed(context, HomeScreen.routeName);
  //   } else {
  //     setState(() {
  //       isLoading = true;
  //       loginState = 1;
  //     });
  //     Navigator.pop(context);
  //   }

  // }

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    void doLogin() {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        final Future<Map<String, dynamic>> respose =
            auth.login(email, password);

        respose.then((response) {
          if (response['status']) {
            // Navigator.pushReplacementNamed(context, '/dashboard');
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          } else {
            showMyDialog(
                "Failed Login:",
                response['message'].toString() + ". Please check your email",
                null,
                context);
          }
        });
      } else {
        const SnackBar(
          content: Text("Invalid form: Please complete the form properly"),
          duration: Duration(seconds: 10),
        );
      }
    }

    final loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CircularProgressIndicator(),
        Text(" Login ... Please wait")
      ],
    );
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
              child: Text(
                "Forgot Password",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: getProportionateScreenWidth(18)),
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          auth.loggedInStatus == Status.authenticating
              ? loading
              : DefaultButton(
                  text: "Log In",
                  press: doLogin,
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
        } else if (value.length < 4) {
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
