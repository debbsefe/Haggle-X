import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final Color backgroundColor;
  final Widget title;
  final bool centerTitle;

  CustomAppBar({
    Key key,
    this.backgroundColor = CustomTheme.purple,
    this.title,
    this.centerTitle,
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 100,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          width: 25,
          height: 25,
          child: Icon(Icons.arrow_back_ios),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CustomTheme.purple50.withOpacity(0.5)),
        ),
      ),
      backgroundColor: backgroundColor,
      elevation: 0,
      title: title ?? Text(''),
      centerTitle: centerTitle ?? true,
    );
  }
}
