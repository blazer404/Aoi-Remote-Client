import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData.dark(useMaterial3: false).copyWith(
    appBarTheme: const AppBarTheme(
      color: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.black,
  );

  static const Color textColor = Colors.white70;
  static const Color accentColor = Color.fromRGBO(76, 175, 80, 1);
  static const Color controlBackgroundColor = Color.fromRGBO(33, 33, 33, 1.0);
}
