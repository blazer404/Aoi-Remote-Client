import 'package:aoi_remote/core/AppTheme.dart';
import 'package:aoi_remote/core/ServerSettings.dart';
import 'package:aoi_remote/helpers/Utils.dart';
import 'package:aoi_remote/helpers/IpAddressInputFormatter.dart';
import 'package:aoi_remote/widgets/ErrorDialogWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController ipController = TextEditingController();
  final TextEditingController portController = TextEditingController();
  final TextEditingController tokenController = TextEditingController();

  Future<void> _loadSettings() async {
    await ServerSettings.load();
    ipController.text = ServerSettings.ip ?? '';
    portController.text = (int.tryParse(ServerSettings.port) != null) ? ServerSettings.port : '';
    tokenController.text = ServerSettings.token ?? '';
  }

  void _saveSetting() {
    final ip = ipController.text.toString();
    final port = portController.text.toString();
    final token = tokenController.text.toString();
    ServerSettings.set(ip, port, token);
    final validateResult = ServerSettings.validate();
    if (!validateResult['success']) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return ErrorDialogWidget(errorText: validateResult['error']);
        },
      );
      return;
    }
    ServerSettings.save();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return buildPage();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget buildPage() {
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
