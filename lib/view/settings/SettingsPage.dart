import 'package:aoi_remote/const/SettingsConst.dart';
import 'package:aoi_remote/core/AppTheme.dart';
import 'package:aoi_remote/helpers/IpAddressInputFormatter.dart';
import 'package:aoi_remote/helpers/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController ipController = TextEditingController();
  final TextEditingController portController = TextEditingController();
  final TextEditingController tokenController = TextEditingController();

  //todo переписать на интерфейс
  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    ipController.text = prefs.getString(SettingsConst.DEVICE_IP)!.toString();
    portController.text = prefs.getInt(SettingsConst.DEVICE_PORT)!.toString();
    tokenController.text = prefs.getString(SettingsConst.DEVICE_TOKEN)!.toString();
  }

  //todo переписать на интерфейс + нужна валидация полей (для ip особенно)
  Future<void> _saveSetting() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(SettingsConst.DEVICE_IP, ipController.text);
    await prefs.setInt(SettingsConst.DEVICE_PORT, int.parse(portController.text));
    await prefs.setString(SettingsConst.DEVICE_TOKEN, tokenController.text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return buildPageUI();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget buildPageUI() {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: ipController,
              inputFormatters: [
                LengthLimitingTextInputFormatter(15),
                Utils.ipAddressFilter(),
                IpAddressInputFormatter()
              ],
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'IP Address'),
            ),
            TextField(
              controller: portController,
              decoration: InputDecoration(labelText: 'Port'),
              inputFormatters: [
                LengthLimitingTextInputFormatter(5),
                Utils.decimalFilter(),
              ],
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: tokenController,
              decoration: InputDecoration(labelText: 'Auth token'),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _saveSetting,
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppTheme.greyDarkColor)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.save_outlined, color: AppTheme.greyColor, size: 20),
                      SizedBox(width: 8),
                      Text('Save', style: TextStyle(color: AppTheme.greyColor)),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
