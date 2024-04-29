import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class AppTheme {
  static ThemeData theme = ThemeData.dark(useMaterial3: false).copyWith(
    appBarTheme: const AppBarTheme(color: Colors.black),
    scaffoldBackgroundColor: Colors.black,
  );

  static const Color greenColor = Color.fromRGBO(76, 175, 80, 1.0);
  static const Color greenLightColor = Color.fromRGBO(139, 195, 74, 1.0);
  static const Color greyColor = Color.fromRGBO(150, 150, 150, 1.0);
  static const Color greyDarkColor = Color.fromRGBO(30, 30, 30, 1.0);

  static const double gradientBorderWidth = 2.0;
  static final List<Color> gradientBorderColors = [Colors.blue.withOpacity(.8), Colors.purple.withOpacity(.8)];
  static final GradientBoxBorder gradientBorder = GradientBoxBorder(
    gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: gradientBorderColors),
    width: gradientBorderWidth,
  );
  static final GradientBoxBorder gradientCircleBorder = GradientBoxBorder(
    gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: gradientBorderColors),
    width: gradientBorderWidth,
  );
}
