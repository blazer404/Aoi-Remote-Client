import 'package:flutter/material.dart';
import '/core/socket_client.dart';

class ButtonToList extends StatelessWidget {
  final String target;
  final Map<String, dynamic> button;

  const ButtonToList({super.key, required this.target, required this.button});

  @override
  Widget build(BuildContext context) {
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
