import 'package:aoi_remote/core/AppTheme.dart';
import 'package:aoi_remote/core/SocketClient.dart';
import 'package:aoi_remote/widgets/ErrorDialogWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class ButtonToList extends StatelessWidget {
  final String target;
  final Map<String, dynamic> button;

  const ButtonToList({super.key, required this.target, required this.button});

  @override
  Widget build(BuildContext context) {
    final buttonSize = button.containsKey('size') ? button['size']?.toDouble() : 50.0;
    final iconSize = buttonSize - 10;

    void _sendCommand() {
      SocketClient.sendCommand(target, button['code']).catchError((error) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorDialogWidget(errorText: error.toString());
          },
        );
      });
    }

    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          RawMaterialButton(
            onPressed: () => {
              Vibrate.feedback(FeedbackType.medium),
              _sendCommand(),
            },
            shape: const CircleBorder(),
            constraints: BoxConstraints(minWidth: buttonSize, minHeight: buttonSize),
            child: Icon(
              button['icon'] is IconData ? button['icon'] : Icons.error,
              color: button['color'] is Color ? button['color'] : AppTheme.textColor,
              size: iconSize,
            ),
          ),
        ],
      ),
    );
  }
}
