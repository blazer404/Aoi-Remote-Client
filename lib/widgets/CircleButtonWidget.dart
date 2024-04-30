import 'package:aoi_remote/core/AppTheme.dart';
import 'package:aoi_remote/core/SocketClient.dart';
import 'package:aoi_remote/widgets/ErrorDialogWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class CircleButtonWidget extends StatelessWidget {
  final String target;
  final int command;
  final IconData icon;
  final double iconSize;
  final Color iconColor;

  const CircleButtonWidget({
    super.key,
    required this.target,
    required this.command,
    this.icon = Icons.error,
    this.iconSize = 40.0,
    this.iconColor = AppTheme.textColor,
  });

  void _sendCommand(BuildContext context) {
    SocketClient.sendCommand(target, command).catchError((error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return ErrorDialogWidget(errorText: error.toString());
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final buttonSize = iconSize + 10;

    return RawMaterialButton(
      onPressed: () => {
        Vibrate.feedback(FeedbackType.medium),
        _sendCommand(context),
      },
      shape: const CircleBorder(),
      constraints: BoxConstraints(minWidth: buttonSize, minHeight: buttonSize),
      child: Icon(icon, color: iconColor, size: iconSize),
    );
  }
}
