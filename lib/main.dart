import 'package:aoi_remote/view/index/IndexPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(
    IndexPage(prefs: prefs),
  );
}
