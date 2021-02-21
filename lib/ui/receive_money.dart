import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:haggle_x/widgets/appbar.dart';
import 'package:haggle_x/widgets/sized_box.dart';
import 'package:sizer/sizer.dart';
import '../theme.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReceiveMoney extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
            title: Text(
          'Receive crypto',
          style: CustomTheme.bodyText2.copyWith(color: Colors.white),
        )),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      color: CustomTheme.grey400.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: CustomTheme.grey500,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/btc_ic.png',
                            scale: 3.0,
                          ),
                          Width(1.5.h),
                          Text(
                            'BTC',
                            style: CustomTheme.bodyText5,
                          )
                        ],
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: CustomTheme.greyish,
                      )
                    ],
                  ),
                ),
                Height(5.0.h),
                Text(
                  'BTC deposit address',
                  style: CustomTheme.label,
                ),
                Height(3.0.h),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13.0),
                      border: Border.all(
                        color: CustomTheme.purple30,
                      )),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13.0),
                    child: QrImage(
                      backgroundColor: Colors.white,
                      data: 'This is a simple QR code',
                      version: QrVersions.auto,
                      size: 30.0.h,
                      gapless: true,
                    ),
                  ),
                ),
                Height(2.5.h),
                Container(
                  decoration: BoxDecoration(
                      color: CustomTheme.grey400.withOpacity(0.2),
                      border: Border.all(
                        color: CustomTheme.grey500,
                      )),
                  child: Row(
                    children: [
                      Width(1.5.h),
                      Expanded(
                        flex: 9,
                        child: Text(
                          getRandString(40),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTheme.label
                              .copyWith(color: Colors.white.withOpacity(0.88)),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                            padding: const EdgeInsets.all(8.0),
                            color: CustomTheme.purple20,
                            child: Image.asset(
                              'assets/images/copy.png',
                              scale: 3.0,
                            )),
                      )
                    ],
                  ),
                ),
                Height(15.0.h),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  decoration: BoxDecoration(
                      color: CustomTheme.grey400.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(
                        color: CustomTheme.grey500,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/info.png',
                        scale: 3.0,
                      ),
                      Width(2.0.h),
                      Text(
                        'Send only BTC to this deposit address',
                        style: CustomTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
                Divider(),
                Text(
                  '• Paste a BTC address only through this means. \n• Sending coins or token other than BTC to this address may result in the loss of your tokens',
                  style: CustomTheme.subtitle3,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String getRandString(int len) {
  var random = Random.secure();
  var values = List<int>.generate(len, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}
