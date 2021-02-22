import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haggle_x/widgets/sized_box.dart';
import 'package:sizer/sizer.dart';
import '../theme.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool centerTitle;

  CustomAppBar({
    Key key,
    this.title,
    this.centerTitle,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        color: CustomTheme.purple,
        margin: const EdgeInsets.only(left: 20, top: 20),
        child: Row(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: CustomTheme.purple50.withOpacity(0.5)),
            ),
            Width(12.0.h),
            Text(
              title ?? '',
              style: CustomTheme.bodyText2.copyWith(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
