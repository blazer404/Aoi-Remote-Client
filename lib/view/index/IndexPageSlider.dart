import 'package:aoi_remote/core/AppTheme.dart';
import 'package:aoi_remote/view/aimp/AimpPage.dart';
import 'package:aoi_remote/view/mpc/MpcPage.dart';
import 'package:flutter/material.dart';

class IndexPageSlider extends StatefulWidget {
  @override
  _IndexPageSliderState createState() => _IndexPageSliderState();
}

class _IndexPageSliderState extends State<IndexPageSlider> {
  final List<Widget> pages = [
    MpcPage(),
    AimpPage(),
  ];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: pages,
        onPageChanged: (int index) {
          setState(() {
            currentPage = index;
          });
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            pages.length,
            (index) => Container(
              width: 6.0,
              height: 6.0,
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentPage == index ? AppTheme.accentColor : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
