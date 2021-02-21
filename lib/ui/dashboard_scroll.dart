import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DashboardScroll extends StatefulWidget {
  @override
  _DashboardScrollState createState() => _DashboardScrollState();
}

class _DashboardScrollState extends State<DashboardScroll> {
  int _currentPage = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 3.5),
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        onPageChanged: _onPageChanged,
        controller: _pageController,
        itemCount: slideList.length,
        itemBuilder: (ctx, i) => SlideItem(i),
      ),
    );
  }
}

class Slide {
  final Widget image;

  Slide({@required this.image});
}

final slideList = [
  Slide(
    image: Image.asset('assets/images/slide.png'),
  ),
  Slide(
    image: Image.asset('assets/images/slide2.png'),
  ),
  Slide(
    image: Image.asset('assets/images/slide.png'),
  ),
];

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.5),
      child: Column(
        children: <Widget>[
          slideList[index].image,
        ],
      ),
    );
  }
}
