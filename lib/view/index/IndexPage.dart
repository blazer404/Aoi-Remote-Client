import 'package:aoi_remote/core/AppTheme.dart';
import 'package:aoi_remote/view/index/IndexPageSlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IndexPage extends StatefulWidget {
  final SharedPreferences prefs;

  const IndexPage({super.key, required this.prefs});

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    final systemTheme = SystemUiOverlayStyle.dark.copyWith(systemNavigationBarColor: Colors.black);
    SystemChrome.setSystemUIOverlayStyle(systemTheme);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemTheme,
      child: MaterialApp(
        home: IndexPageSlider(),
        theme: AppTheme.theme,
      ),
    );
  }
}
