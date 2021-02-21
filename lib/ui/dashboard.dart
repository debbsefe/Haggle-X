import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haggle_x/theme.dart';
import 'package:haggle_x/ui/receive_money.dart';
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
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopWidget(),
                DashboardScroll(),
                BottomWidget(),
              ],
            ),
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
    return Container(
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
          DashboardTile(
            title: 'Dash (DASH)',
            subtitle: 'NGN 4,272,147.00',
            subtitle2: '+2.34%',
            trailing: 'assets/images/chart2.png',
          ),
          DashboardTile(
            title: 'Dodgecoin (DOGE)',
            subtitle: 'NGN 4,272,147.00',
            trailing: 'assets/images/chart.png',
          ),
          DashboardTile(
            title: 'Litecoin (LTC)',
            subtitle: 'NGN 4,272,147.00',
            subtitle2: '+2.34%',
            trailing: 'assets/images/chart1.png',
          ),
          Text(
            'Do more with HaggleX',
            style: CustomTheme.bodyText2,
          ),
          Height(2.5.h),
          CustomListTile(
            title: 'Send money instantly',
            subtitle: 'Send crypto to another wallet',
            leading: 'assets/images/send.png',
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => ReceiveMoney());
            },
            child: CustomListTile(
              title: 'Receive money from anyone',
              subtitle: 'Receive crypto from another wallet',
              leading: 'assets/images/receive.png',
            ),
          ),
          CustomListTile(
            title: 'Virtual Card',
            subtitle: 'Make faster payments using HaggleX cards',
            leading: 'assets/images/card.png',
          ),
          CustomListTile(
            title: 'Global Remittance',
            subtitle: 'Send money to anyone, anywhere',
            leading: 'assets/images/global.png',
          ),
          Height(5.0.h),
          Text(
            'Trending crypto news',
            style: CustomTheme.bodyText2,
          ),
          Height(2.5.h),
          TrendingNews(),
          TrendingNews(),
          TrendingNews(),
          TrendingNews(),
          TrendingNews(),
          Divider(),
          ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: Text(
                'View all stories',
                style: CustomTheme.bodyText4,
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black,
              )),
          Divider(),
        ],
      ),
    );
  }
}

class TrendingNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/bitcoin.jpg',
              ),
            ),
          ),
          Width(4.0.h),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Blockchain Bites: BTC on Ethereum, DeFi’s latest stablecoin, the currency cold wars",
                  style: CustomTheme.bodyText4,
                ),
                Height(1.0.h),
                Row(
                  children: [
                    Text('6hrs ago',
                        style: CustomTheme.subtitlelight
                            .copyWith(color: CustomTheme.grey600)),
                    Width(4.0.h),
                    RichText(
                      text: TextSpan(
                          text: 'Category: ',
                          style: CustomTheme.subtitlelight
                              .copyWith(color: CustomTheme.grey600),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'DeFi',
                              style: CustomTheme.subtitlelight,
                            )
                          ]),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String leading, subtitle, title;

  const CustomListTile({Key key, this.leading, this.subtitle, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Card(
        shadowColor: CustomTheme.grey,
        elevation: 1.5,
        child: ListTile(
          title: Text(
            title,
            style: CustomTheme.bodyText3,
          ),
          subtitle: Text(
            subtitle,
            style: CustomTheme.subtitlelight,
          ),
          leading: Image.asset(leading),
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
