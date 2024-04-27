import 'package:aoi_remote/view/AimpPage.dart';
import 'package:flutter/material.dart';
import 'package:aoi_remote/view/MpcPage.dart';

class PagesSlider extends StatefulWidget {
  @override
  _PagesSliderState createState() => _PagesSliderState();
}

class _PagesSliderState extends State<PagesSlider> {
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
                color: currentPage == index ? Color.fromRGBO(76, 175, 80, 1) : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
