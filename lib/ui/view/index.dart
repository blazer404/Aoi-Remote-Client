import 'package:flutter/material.dart';
import '/ui/view/mpc/index.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(), home: const MpcPage());
  }
}
