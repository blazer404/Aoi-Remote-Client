import 'dart:convert';
import 'dart:io';

import 'package:aoi_remote/const/SettingsConst.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SocketClient {
  static Future<void> sendCommand(dynamic target, dynamic command) async {
    //todo переписать на интерфейс
    final prefs = await SharedPreferences.getInstance();
    String? ip = prefs.getString(SettingsConst.DEVICE_IP);
    int? port = prefs.getInt(SettingsConst.DEVICE_PORT);
    String? token = prefs.getString(SettingsConst.DEVICE_TOKEN);

    if (ip == null || port == null || token == null) {
      return Future.error('Check connection settings');
    }

    final request = 'T=$target&C=$command&P=$token';
    Socket socket = await Socket.connect(ip, port);
    socket.writeln(request);
    await socket.flush();

    socket.listen(
      (data) {
        String response = utf8.decode(data);
        if (kDebugMode) print('Ответ от сервера: $response');
      },
      onDone: () {
        //print('Соединение закрыто');
        //socket.destroy();
      },
      onError: (error) {
        // Игнорируем ошибку "Connection reset by peer"
        if (error.osError.errorCode != 104) {
          if (kDebugMode) print('Ошибка при приеме данных: $error');
        }
      },
    );
  }
}
