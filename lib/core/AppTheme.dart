import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData.dark(useMaterial3: true).copyWith(
    appBarTheme: const AppBarTheme(
      color: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.black,
  );
}