import 'dart:convert';
import 'package:http/http.dart' as fetch;
import 'media_player.dart';

class HttpClient {


  //todo need get this variables from app settings
  static const defaultTarget = MediaPlayer.MPC;
  static const defaultToken = '12345678';
  static final defaultUrl = Uri.parse('http://192.168.88.100:1337');

  static getToken() {
    return defaultToken;
  }

  static getUrl() {
    return defaultUrl;
  }
  // todo end todo

  /// Общий метод для отправки запросов на сервер
  static Future<void> sendCode(target, command) async {
    final token = getToken();
    final url = getUrl();

    final Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    final Map<String, dynamic> body = {
      'player': target, //todo need replace to target
      'command': command,
    };
    final response = await fetch.post(url, body: json.encode(body), headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      print(data); //todo message on screen
    } else {
      print('Ошибка: ${response.statusCode}'); //todo message on screen
    }
  }
}
