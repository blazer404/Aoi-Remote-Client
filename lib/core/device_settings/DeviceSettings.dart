import 'package:aoi_remote/const/SettingsConst.dart';
import 'package:aoi_remote/core/device_settings/DeviceSettingsInterface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceSettings implements DeviceSettingsInterface {
  final SharedPreferences prefs;

  const DeviceSettings({required this.prefs});

  @override
  String? getName() {
    return prefs.getString(SettingsConst.DEVICE_NAME);
  }

  @override
  String? getIp() {
    return prefs.getString(SettingsConst.DEVICE_IP);
  }

  @override
  int? getPort() {
    return prefs.getInt(SettingsConst.DEVICE_PORT);
  }

  @override
  String? getToken() {
    return prefs.getString(SettingsConst.DEVICE_TOKEN);
  }

  @override
  Future<void> setPrefs(String name, String ip, String port, String token) async {
    await prefs.setString(SettingsConst.DEVICE_NAME, name);
    await prefs.setString(SettingsConst.DEVICE_IP, ip);
    await prefs.setString(SettingsConst.DEVICE_PORT, port);
    await prefs.setString(SettingsConst.DEVICE_TOKEN, token);
  }
}
