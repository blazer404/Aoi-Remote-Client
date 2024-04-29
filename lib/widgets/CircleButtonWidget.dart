import 'package:aoi_remote/core/AppTheme.dart';
import 'package:aoi_remote/core/SocketClient.dart';
import 'package:aoi_remote/widgets/ErrorDialogWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class CircleButtonWidget extends StatefulWidget {
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
    this.iconColor = AppTheme.greyColor,
  });

  @override
  _CircleButtonWidgetWidgetState createState() => _CircleButtonWidgetWidgetState();
}

class _CircleButtonWidgetWidgetState extends State<CircleButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final buttonSize = widget.iconSize + 10;

    void _sendCommand() {
      SocketClient.sendCommand(widget.target, widget.command).catchError((error) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ErrorDialogWidget(errorText: error.toString());
          },
        );
      });
    }

    return RawMaterialButton(
      onPressed: () => {
        Vibrate.feedback(FeedbackType.medium),
        _sendCommand(),
      },
      shape: const CircleBorder(),
      constraints: BoxConstraints(minWidth: buttonSize, minHeight: buttonSize),
      focusColor: Colors.transparent,
      child: Icon(widget.icon, color: widget.iconColor, size: widget.iconSize),
    );
  }
}
