import 'package:flutter/material.dart';
import '/core/socket_client.dart';

class ButtonsLayout extends StatelessWidget {
  const ButtonsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  /// Создание строки из массива кнопок
  static Widget createRow(target, List<Map<String, dynamic>> buttonsList) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: buttonsList.map((button) {
        return _setList(target, button);
      }).toList(),
    );
  }

  /// Создание столбца из массива кнопок
  static Widget createColumn(target, List<Map<String, dynamic>> buttonsList) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: buttonsList.map((button) {
        return _setList(target, button);
      }).toList(),
    );
  }

  ///Общий метод для создания списка кнопок
  static Widget _setList(target, Map<String, dynamic> button) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          RawMaterialButton(
            onPressed: () => SocketClient.sendCode(target, button['code']),
            fillColor: Colors.grey,
            shape: const CircleBorder(),
            constraints: const BoxConstraints(minWidth: 50, minHeight: 50),
            child: Icon(
              button['icon'],
              color: Colors.black,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
