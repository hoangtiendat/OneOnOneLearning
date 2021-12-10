import 'package:flutter/material.dart';
import 'package:one_on_one_learning/components/default_button.dart';

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
  String? address;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenHeight(20)),
        child: Column(
          children: [
            buildNameFormField(),
            SizedBox(height: getProportionateScreenWidth(20)),
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenWidth(20)),
            buildPhoneNumberFormField(),
            SizedBox(height: getProportionateScreenWidth(20)),
            buildAddressFormField(),
            SizedBox(height: getProportionateScreenWidth(30)),
            DefaultButton(
              text: "Save Changes",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      initialValue: "123 Nguyễn Văn Cừ, Q.5",
      onSaved: (newValue) => address = newValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.isEmpty) {
          return kAddressNullError;
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Address",
        hintText: "Enter your phone address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.maps_home_work),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      initialValue: "0123456789",
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
      initialValue: "example@gmail.com",
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
      initialValue: "Sơn Nguyễn",
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
