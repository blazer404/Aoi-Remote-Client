import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/core/dictionary.dart';
import '/ui/view/mpc/index.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //красим системную панель навигации
    final systemTheme = SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: Colors.black,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);

    //вкл только портретный режим
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return new AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemTheme,
      child: _setApp(),
    );
  }

  Widget _setApp() {
    final appTheme = ThemeData.dark(useMaterial3: false).copyWith(
      appBarTheme: const AppBarTheme(
        color: Colors.black,
      ),
      scaffoldBackgroundColor: Colors.black,
    );

    return MaterialApp(
      theme: appTheme,
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
        body: SafeArea(child: MpcPage()),
      ),
    );
  }
}
