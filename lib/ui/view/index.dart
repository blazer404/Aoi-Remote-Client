import 'package:flutter/material.dart';
import '/core/dictionary.dart';
import '/ui/view/mpc/index.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final darkTheme = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.black,
      hintColor: Colors.grey,
      appBarTheme: const AppBarTheme(
        color: Colors.black,
      ),
    );

    return MaterialApp(
        theme: darkTheme,
        home: Scaffold(
          appBar: AppBar(
            title: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Image(
                    image: AssetImage('lib/assets/img/app_icon.png'),
                    fit: BoxFit.contain,
                    width: 24,
                    height: 24,
                  ),
                ),
                Text(Dictionary.APP_NAME),
              ],
            ),
          ),
          body: const MpcPage(),
        ));
  }
}
