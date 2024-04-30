import 'package:aoi_remote/core/AppTheme.dart';
import 'package:aoi_remote/core/Settings.dart';
import 'package:aoi_remote/helpers/IpAddressInputFormatter.dart';
import 'package:aoi_remote/helpers/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ipController = TextEditingController();
  final TextEditingController portController = TextEditingController();
  final TextEditingController tokenController = TextEditingController();

  static const String nameControllerLabel = 'Device name';
  static const String ipControllerLabel = 'IP Address';
  static const String portControllerLabel = 'Port';
  static const String tokenControllerLabel = 'Auth token';

  Future<void> _loadDevice() async {
    Settings.loadDevice().then((value) {
      nameController.text = value['name'];
      ipController.text = value['ip'];
      portController.text = value['port'];
      tokenController.text = value['token'];
    });
  }

  Future<void> _saveDevice() async {
    final Map<String, dynamic> data = {
      'name': nameController.text,
      'ip': ipController.text,
      'port': portController.text,
      'token': tokenController.text,
    };
    Settings.saveDevice(data).then((value) => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadDevice(),
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
              controller: nameController,
              decoration: InputDecoration(labelText: nameControllerLabel),
            ),
            TextField(
              controller: ipController,
              inputFormatters: [
                LengthLimitingTextInputFormatter(15),
                Utils.ipAddressFilter(),
                IpAddressInputFormatter()
              ],
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: ipControllerLabel),
            ),
            TextField(
              controller: portController,
              decoration: InputDecoration(labelText: portControllerLabel),
              inputFormatters: [
                LengthLimitingTextInputFormatter(5),
                Utils.decimalFilter(),
              ],
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: tokenController,
              decoration: InputDecoration(labelText: tokenControllerLabel),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () => {
                    Vibrate.feedback(FeedbackType.medium),
                    _saveDevice(),
                  },
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppTheme.backgroundColor)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.save_outlined, color: AppTheme.textColor, size: 20),
                      SizedBox(width: 8),
                      Text('Save', style: TextStyle(color: AppTheme.textColor)),
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
