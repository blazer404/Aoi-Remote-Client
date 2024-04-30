import 'package:aoi_remote/const/SettingsConst.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  static Future<SharedPreferences> _getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  /**
   * Сохранить настройки устройства
   */
  static Future<void> saveDevice(Map<String, dynamic> data) async {
    //todo нужна валидация полей (особенно ip и порт)
    final prefs = await _getPrefs();
    await prefs.setString(SettingsConst.DEVICE_NAME, data['name']);
    await prefs.setString(SettingsConst.DEVICE_IP, data['ip']);
    await prefs.setInt(SettingsConst.DEVICE_PORT, int.parse(data['port']));
    await prefs.setString(SettingsConst.DEVICE_TOKEN, data['token']);
  }

  /**
   * Загрузить настройки устройства
   */
  static Future<Map<String, dynamic>> loadDevice() async {
    final prefs = await _getPrefs();
    final name = prefs.getString(SettingsConst.DEVICE_NAME)?.toString() ?? '';
    final ip = prefs.getString(SettingsConst.DEVICE_IP)?.toString() ?? '';
    final port = prefs.getInt(SettingsConst.DEVICE_PORT)?.toString() ?? '';
    final token = prefs.getString(SettingsConst.DEVICE_TOKEN)?.toString() ?? '';
    return {'name': name, 'ip': ip, 'port': port, 'token': token};
  }
}
