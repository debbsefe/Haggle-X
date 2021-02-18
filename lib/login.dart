import 'package:flutter/material.dart';
import 'package:haggle_x/signup.dart';
import 'package:haggle_x/theme.dart';
import 'package:haggle_x/utils/field_validator.dart';
import 'package:haggle_x/widgets/buttons.dart';
import 'package:haggle_x/widgets/sized_box.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 10.0.h, left: 5.0.h, right: 5.0.h),
          child: ListView(
            children: [
              Text('Welcome', style: CustomTheme.headline3),
              Height(
                3.0.h,
              ),
              Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Height(1.0.h),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _email,
                        style: CustomTheme.label,
                        decoration: inputDecoration.copyWith(
                          hintText: 'Email Address',
                        ),
                        validator: FieldValidator.validateEmail,
                      ),
                      Height(2.0.h),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _password,
                        style: CustomTheme.label,
                        decoration: inputDecoration.copyWith(
                            hintText: 'Password (Min. 8 characters)'),
                        validator: FieldValidator.validatePassword,
                      ),
                      Height(3.0.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          FlatButton(
                            onPressed: () => null,
                            child: Text('Forgot password?',
                                style: CustomTheme.label),
                          ),
                        ],
                      ),
                      Height(4.0.h),
                      CustomButton(
                        buttonName: 'Log in'.toUpperCase(),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {}
                        },
                      ),
                      Height(3.0.h),
                      Center(
                        child: FlatButton(
                          onPressed: () {
                            Get.to(() => SignUp());
                          },
                          child: Text('New User? Create an account',
                              style: CustomTheme.label),
                        ),
                      ),
                      Height(5.0.h),
                      Center(child: Image.asset('assets/images/finger.png'))
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const inputDecoration = InputDecoration(
  hintStyle: CustomTheme.label,
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: CustomTheme.white),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: CustomTheme.white),
  ),
);
