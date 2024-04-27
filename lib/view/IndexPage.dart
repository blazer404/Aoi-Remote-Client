import 'package:aoi_remote/core/AppTheme.dart';
import 'package:aoi_remote/widgets/PagesSliderWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final systemTheme = SystemUiOverlayStyle.dark.copyWith(systemNavigationBarColor: Colors.black);
    SystemChrome.setSystemUIOverlayStyle(systemTheme);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemTheme,
      child: MaterialApp(
        home: PagesSlider(),
        theme: AppTheme.theme,
      ),
    );
  }
}
