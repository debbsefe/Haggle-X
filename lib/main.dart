import 'package:flutter/material.dart';
import 'package:haggle_x/theme.dart';
import 'package:sizer/sizer.dart';
import 'login.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizerUtil().init(constraints, orientation);
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              scaffoldBackgroundColor: CustomTheme.purple,
              fontFamily: 'BasisGrotesquePro'),
          debugShowCheckedModeBanner: false,
          home: Login(),
        );
      });
    });
  }
}
