import 'package:aoi_remote/const/AimpConst.dart';
import 'package:aoi_remote/const/MpcConst.dart';
import 'package:aoi_remote/core/AppTheme.dart';
import 'package:aoi_remote/view/aimp/AimpPage.dart';
import 'package:aoi_remote/view/mpc/MpcPage.dart';
import 'package:aoi_remote/widgets/AppBarWidget.dart';
import 'package:flutter/material.dart';

class IndexPageSlider extends StatefulWidget {
  @override
  _IndexPageSliderState createState() => _IndexPageSliderState();
}

class _IndexPageSliderState extends State<IndexPageSlider> {
  int currentPage = 0;
  final List<Widget> pages = [
    MpcPage(),
    AimpPage(),
  ];
  final List<String> titles = [
    MpcConst.TITLE,
    AimpConst.TITLE,
  ];
  final List<String> icons = [
    MpcConst.ICON,
    AimpConst.ICON,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: titles[currentPage], icon: icons[currentPage]),
      body: PageView(
        children: pages,
        onPageChanged: (int index) {
          setState(() {
            currentPage = index;
          });
          //todo запонить последнюю выбранную страницу
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
                color: currentPage == index ? AppTheme.primaryAccentColor : AppTheme.textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
