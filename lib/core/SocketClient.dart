import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:aoi_remote/core/ServerSettings.dart';

class SocketClient {
  static Future<void> sendCommand(dynamic target, dynamic command) async {
    await ServerSettings.load();
    String ip = ServerSettings.ip;
    String port = ServerSettings.port;
    String token = ServerSettings.token;

    if (ip.isEmpty || port.isEmpty || token.isEmpty) {
      return Future.error('Check connection settings');
    }

    final request = 'T=$target&C=$command&P=$token';
    Socket socket = await Socket.connect(ip, int.parse(port));
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
