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

  static LinearGradient gradientBorder = LinearGradient(
    begin: Alignment.center,
    end: Alignment.bottomCenter,
    colors: [Colors.blue.withOpacity(.5), Colors.purple.withOpacity(.5), Colors.red.withOpacity(.5)],
  );

  static LinearGradient gradientBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppTheme.controlBackgroundColor.withOpacity(.8), AppTheme.controlBackgroundColor],
  );
}
