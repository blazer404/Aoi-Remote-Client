import 'package:aoi_remote/view/settings/SettingsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:keep_screen_on/keep_screen_on.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final String icon;

  AppBarWidget({super.key, required this.title, this.icon = 'logo'});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> with WidgetsBindingObserver {
  static const Icon _keepScreenEnabledIcon = Icon(Icons.brightness_7);
  static const Icon _keepScreenDisabledIcon = Icon(Icons.brightness_auto_outlined);
  static const Color _keepScreenEnabledIconColor = Colors.green;
  static const Color _keepScreenDisabledIconColor = Colors.white;

  bool _keepScreenState = false; //запоминаем состояние экрана, чтобы при разворачивании вернуть его
  Icon _keepScreenIcon = _keepScreenDisabledIcon;
  Color _keepScreenColor = _keepScreenDisabledIconColor;

  /**
   * Переключение состояния "экран включен"
   */
  Future<void> _keepScreenToggle() async {
    bool? isScreenOn = await KeepScreenOn.isOn;
    if (isScreenOn == null) isScreenOn = false;
    if (isScreenOn) {
      _keepScreenOff();
      setState(() => _keepScreenState = false);
    } else {
      _keepScreenOn();
      setState(() => _keepScreenState = true);
    }
  }

  /**
   * Включение состояния "экран включен"
   */
  _keepScreenOn() {
    KeepScreenOn.turnOn();
    setState(() {
      _keepScreenIcon = _keepScreenEnabledIcon;
      _keepScreenColor = _keepScreenEnabledIconColor;
    });
  }

  /**
   * Отключение состояния "экран включен"
   */
  _keepScreenOff() {
    KeepScreenOn.turnOff();
    setState(() {
      _keepScreenIcon = _keepScreenDisabledIcon;
      _keepScreenColor = _keepScreenDisabledIconColor;
    });
  }

  /**
   * Переход на страницу настроек
   */
  void _navigateToSettingsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SettingsPage()),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    state == AppLifecycleState.resumed && _keepScreenState == true ? _keepScreenOn() : _keepScreenOff();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Image(
              image: AssetImage('lib/assets/images/${widget.icon}.png'),
              fit: BoxFit.contain,
              width: 20,
              height: 20,
            ),
          ),
          Flexible(
            child: Text(widget.title, overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: _keepScreenIcon,
          color: _keepScreenColor,
          onPressed: () {
            Vibrate.feedback(FeedbackType.medium);
            _keepScreenToggle();
          },
        ),
        IconButton(
          icon: Icon(Icons.settings),
          color: Colors.white,
          onPressed: () => _navigateToSettingsPage(context),
        ),
      ],
    );
  }
}
