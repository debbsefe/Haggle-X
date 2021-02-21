import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haggle_x/theme.dart';
import 'package:haggle_x/widgets/sized_box.dart';
import 'package:sizer/sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'dashboard_scroll.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 4, child: TopWidget()),
              Expanded(flex: 3, child: DashboardScroll()),
              Expanded(flex: 5, child: BottomWidget()),
            ],
          )),
    );
  }
}

class TopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: CustomTheme.purple,
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/sv.png',
                  height: 40,
                ),
                Text(
                  'HaggleX',
                  style: CustomTheme.headline4,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/notif.png',
                      height: 40,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 35),
                      padding: const EdgeInsets.all(3.5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomTheme.red,
                      ),
                      child: Text(
                        '5',
                        style: CustomTheme.label,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Height(2.5.h),
            Text(
              'Total portfolio balance',
              style: CustomTheme.subtitlewhite,
            ),
            Height(2.5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$****',
                  style: CustomTheme.bodyText,
                ),
                ToggleSwitch(
                  initialLabelIndex: 1,
                  fontSize: 9,
                  cornerRadius: 20.0,
                  activeBgColor: CustomTheme.orange500,
                  activeFgColor: Colors.black,
                  inactiveBgColor: Colors.white,
                  inactiveFgColor: Colors.black,
                  labels: ['USD', 'NGN'],
                  onToggle: (index) {},
                ),
              ],
            ),
          ],
        ));
  }
}

class BottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Height(2.5.h),
            Text(
              'Markets',
              style: CustomTheme.bodyText2,
            ),
            Height(2.5.h),
            DashboardTile(
              title: 'Haggle (HAG)',
              subtitle: 'NGN 380',
              trailing: 'assets/images/chart.png',
            ),
            DashboardTile(
              title: 'Bitcoin (BTC)',
              subtitle: 'NGN 4,272,147.00',
              subtitle2: '+2.34%',
              trailing: 'assets/images/chart1.png',
            ),
            DashboardTile(
              title: 'Ethereum (ETH)',
              subtitle: 'NGN 4,272,147.00',
              subtitle2: '+2.34%',
              trailing: 'assets/images/chart2.png',
            ),
            DashboardTile(
              title: 'Tether (USDT)',
              subtitle: 'NGN 4,272,147.00',
              trailing: 'assets/images/chart.png',
            ),
            DashboardTile(
              title: 'Bitcoin Cash (BCH)',
              subtitle: 'NGN 4,272,147.00',
              subtitle2: '+2.34%',
              trailing: 'assets/images/chart1.png',
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardTile extends StatelessWidget {
  final String title, subtitle, trailing, subtitle2;

  const DashboardTile(
      {Key key,
      @required this.title,
      @required this.subtitle,
      @required this.trailing,
      this.subtitle2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/hagglex.png'),
                  Width(2.0.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: CustomTheme.title),
                      Height(1.0.h),
                      RichText(
                        text: TextSpan(
                            text: subtitle + '   ',
                            style: CustomTheme.subtitlelight
                                .copyWith(color: Colors.black.withOpacity(0.5)),
                            children: <TextSpan>[
                              TextSpan(
                                text: subtitle2 ?? '',
                                style: CustomTheme.subtitlelight
                                    .copyWith(color: CustomTheme.lightgreen),
                              )
                            ]),
                      ),
                    ],
                  ),
                ],
              ),
              Image.asset(trailing),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
