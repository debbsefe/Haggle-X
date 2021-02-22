import 'package:flutter/material.dart';
import 'package:haggle_x/services/main_service.dart';
import 'package:haggle_x/widgets/appbar.dart';
import 'package:haggle_x/theme.dart';
import 'package:haggle_x/utils/field_validator.dart';
import 'package:haggle_x/widgets/buttons.dart';
import 'package:haggle_x/widgets/dialogs.dart';
import 'package:haggle_x/widgets/input_decoration.dart';
import 'package:haggle_x/widgets/sized_box.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'dashboard_tab.dart';

class SignUp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _referralcode = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                shape: BoxShape.rectangle,
                color: Colors.white,
              ),
              margin: EdgeInsets.all(2.0.h),
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: 5.0.h,
                  horizontal: 4.0.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Create a new account', style: CustomTheme.headline5),
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
                              style: CustomTheme.labelblack,
                              decoration: blackinputDecoration.copyWith(
                                hintText: 'Email Address',
                              ),
                              validator: FieldValidator.validateEmail,
                            ),
                            Height(2.0.h),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _password,
                              obscureText: true,
                              style: CustomTheme.labelblack,
                              decoration: blackinputDecoration.copyWith(
                                  hintText: 'Password (Min. 8 characters)'),
                              validator: FieldValidator.validatePassword,
                            ),
                            Height(2.0.h),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _username,
                              style: CustomTheme.labelblack,
                              decoration: blackinputDecoration.copyWith(
                                  hintText: 'Create a username'),
                              validator: FieldValidator.validateField,
                            ),
                            Height(2.0.h),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _phone,
                              style: CustomTheme.labelblack,
                              decoration: blackinputDecoration.copyWith(
                                  hintText:
                                      'Enter your phone number (081xxxxxxxx)',
                                  prefixIcon: Container(
                                    decoration: BoxDecoration(
                                      color: CustomTheme.notwhite,
                                      border: Border.all(
                                          color: CustomTheme.black, width: 0.5),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(2.0),
                                      ),
                                    ),
                                    padding: EdgeInsets.all(5),
                                    margin: EdgeInsets.only(right: 3),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Image.asset('assets/images/ngflag.png',
                                            height: 13),
                                        Text(
                                          '(+234)',
                                          style: CustomTheme.subtitlelight,
                                        ),
                                      ],
                                    ),
                                  ),
                                  prefixIconConstraints:
                                      BoxConstraints(maxWidth: 65)),
                              validator: FieldValidator.validatePhoneNumber,
                            ),
                            Height(2.0.h),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _referralcode,
                              style: CustomTheme.labelblack,
                              decoration: blackinputDecoration.copyWith(
                                  hintText: 'Referral code (optional)'),
                            ),
                            Height(2.0.h),
                            Text(
                              'By signing, you agree to HaggleX terms and privacy policy.',
                              style:
                                  CustomTheme.labelblack.copyWith(fontSize: 10),
                            ),
                            Height(4.0.h),
                            CustomGradientButton(
                              color1: CustomTheme.darkpurple,
                              color2: CustomTheme.purple50,
                              buttonName: 'Log in'.toUpperCase(),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  showLoader(context);
                                  final _provider =
                                      Provider.of<MainAppProvider>(context,
                                          listen: false);

                                  var result = await _provider.register(
                                      email: _email.text,
                                      phonenumber: _phone.text,
                                      username: _username.text,
                                      password: _password.text,
                                      referralCode: _referralcode.text);
                                  if (result['success']) {
                                    Get.to(() => DashboardTab());
                                  } else {
                                    dialogBox(_provider.error, context);
                                  }
                                }
                              },
                            ),
                            Height(3.0.h),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
