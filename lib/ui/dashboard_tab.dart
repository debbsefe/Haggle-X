import 'package:flutter/material.dart';

import '../theme.dart';
import 'dashboard.dart';
import 'other_views.dart';

class DashboardTab extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _DashboardTabState();
  }
}

class _DashboardTabState extends State<DashboardTab> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      Dashboard(),
      Wallet(),
      OTC(),
      Savings(),
      More()
    ];

    return Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
            canvasColor: CustomTheme.white,
          ),
          child: BottomNavigationBar(
            onTap: onTabTapped,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            items: [
              bottomNavigationBar(
                image: 'assets/images/dashboard.png',
              ),
              bottomNavigationBar(
                image: 'assets/images/wallet.png',
              ),
              bottomNavigationBar(image: 'assets/images/otc.png'),
              bottomNavigationBar(image: 'assets/images/savings.png'),
              bottomNavigationBar(image: 'assets/images/Utilities.png'),
            ],
          ),
        ));
  }

  BottomNavigationBarItem bottomNavigationBar({
    @required String image,
  }) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        image,
        height: 50,
      ),
      label: '',
    );
  }
}
