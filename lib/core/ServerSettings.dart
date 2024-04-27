import 'package:shared_preferences/shared_preferences.dart';

class ServerSettings {
  static String ip = '';
  static String port = '';
  static String token = '';

  /**
   * Установка параметров
   */
  static void set(String newIp, String newPort, String newAuthToken) {
    ip = newIp;
    port = newPort;
    token = newAuthToken;
  }

  /**
   *Валидация параметров
   */
  static Map<String, dynamic> validate() {
    var errors = [];
    if (ip.isEmpty) {
      errors.add('IP Address is empty');
    }
    if (port.isEmpty) {
      errors.add('Port is empty');
    } else {
      int portValue = int.tryParse(port) ?? 0;
      if (portValue < 1024 || portValue > 65535) {
        errors.add('Port is invalid. It must be in range from 1024 to 65535');
      }
    }
    if (token.isEmpty) {
      errors.add('Token is empty');
    }
    if (errors.isNotEmpty) {
      return {'success': false, 'error': errors.join("\r\n")};
    }
    return {'success': true};
  }

  /**
   *Сохранение настроек
   */
  static Future<void> save() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('ip', ip);
    await prefs.setString('port', port);
    await prefs.setString('token', token);
  }

  /**
   *Получение настроек
   */
  static Future<void> load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    ip = prefs.getString('ip') ?? '';
    port = prefs.getString('port') ?? '';
    token = prefs.getString('token') ?? '';
  }
}
