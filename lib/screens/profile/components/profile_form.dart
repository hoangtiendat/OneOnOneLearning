import 'package:flutter/material.dart';
import 'package:one_on_one_learning/components/default_button.dart';
import 'package:one_on_one_learning/models/auth/user.dart';
import 'package:one_on_one_learning/provider/auth_provider.dart';
import 'package:one_on_one_learning/screens/profile/components/profile_pic.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? phoneNumber;
  String? birthday;
  String avatar = "";
  User? user;

  @override
  Widget build(BuildContext context) {
    user = Provider.of<AuthProvider>(context).user;
    setState(() {
      name = user!.name;
      email = user!.email;
      phoneNumber = user!.phone;
      birthday = user!.birthday;
      avatar = user!.avatar!;
    });

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenHeight(20)),
        child: Column(
          children: [
            ProfilePic(avatar: avatar),
            SizedBox(height: getProportionateScreenWidth(30)),
            buildNameFormField(),
            SizedBox(height: getProportionateScreenWidth(20)),
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenWidth(20)),
            buildPhoneNumberFormField(),
            // SizedBox(height: getProportionateScreenWidth(20)),
            // buildAddressFormField(),
            // SelectDate(
            //   date: birthday!,
            // ),
            SizedBox(height: getProportionateScreenWidth(35)),
            DefaultButton(
              text: "Save Changes",
              press: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  final parameters = {"name": name, "phone": phoneNumber};
                  Provider.of<AuthProvider>(context, listen: false)
                      .updateUser(parameters);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  // TextFormField buildAddressFormField() {
  //   return TextFormField(
  //     initialValue: address,
  //     onSaved: (newValue) => address = newValue,
  //     autovalidateMode: AutovalidateMode.onUserInteraction,
  //     validator: (value) {
  //       if (value!.isEmpty) {
  //         return kAddressNullError;
  //       }
  //       return null;
  //     },
  //     decoration: const InputDecoration(
  //       labelText: "Address",
  //       hintText: "Enter your phone address",
  //       floatingLabelBehavior: FloatingLabelBehavior.always,
  //       suffixIcon: Icon(Icons.maps_home_work),
  //     ),
  //   );
  // }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      initialValue: phoneNumber,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.isEmpty) {
          return kPhoneNumberNullError;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.phone_android),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      initialValue: email,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => email = newValue,
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
        hintText: "Enter your email",
        suffixIcon: Icon(Icons.mail),
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      initialValue: name,
      onSaved: (newValue) => name = newValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.isEmpty) {
          return kNamelNullError;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Name",
        hintText: "Enter your name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.text_fields),
      ),
    );
  }
}
