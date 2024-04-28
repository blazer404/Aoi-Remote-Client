import 'package:aoi_remote/view/settings/SettingsPage.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String icon;

  AppBarWidget({super.key, required this.title, this.icon = 'logo'});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Image(
              image: AssetImage('lib/assets/images/${icon}.png'),
              fit: BoxFit.contain,
              width: 20,
              height: 20,
            ),
          ),
          Text(title),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
          },
        ),
      ],
    );
  }
}
