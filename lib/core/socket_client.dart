import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';

class SocketClient {
  static Future<void> sendCode(dynamic target, dynamic command) async {
    //todo need set this variable from settings
    // and set their on clsss constructor
    const token = '12345678';
    const url = '192.168.88.100';
    const port = 1337;

    final request = 'T=$target&C=$command&P=$token';

    Socket socket = await Socket.connect(url, port);
    socket.writeln(request);
    await socket.flush();

    socket.listen(
      (List<int> data) {
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
