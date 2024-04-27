import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aoi_remote/helpers/FormatterHelper.dart';
import 'package:aoi_remote/helpers/IpAddressInputFormatter.dart';
import 'package:aoi_remote/core/ServerSettings.dart';
import 'package:aoi_remote/widgets/ErrorDialogWidget.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController ipController = TextEditingController();
  final TextEditingController portController = TextEditingController();
  final TextEditingController tokenController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await ServerSettings.load();
      setState(() {
        ipController.text = ServerSettings.ip ?? '';
        portController.text = int.tryParse(ServerSettings.port) != null ? ServerSettings.port : '';
        tokenController.text = ServerSettings.token ?? '';
      });
    });
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
  }

  @override
  Widget build(BuildContext context) {
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
                FormatterHelper.ipAddressFilter(),
                IpAddressInputFormatter()
              ],
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'IP Address',
              ),
            ),
            TextField(
              controller: portController,
              decoration: InputDecoration(
                labelText: 'Port',
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(5),
                FormatterHelper.decimalFilter(),
              ],
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: tokenController,
              decoration: InputDecoration(
                labelText: 'Auth token',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveSetting,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
