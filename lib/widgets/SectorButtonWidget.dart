import 'dart:math' as math;

import 'package:aoi_remote/core/AppTheme.dart';
import 'package:aoi_remote/core/SocketClient.dart';
import 'package:aoi_remote/widgets/ErrorDialogWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class SectorButtonWidget extends StatefulWidget {
  final String target;
  final int command;
  final IconData icon;
  final double circleDiameter;
  final String borderRadiusPosition;

  SectorButtonWidget({
    required this.target,
    required this.command,
    required this.icon,
    required this.circleDiameter,
    required this.borderRadiusPosition,
  });

  @override
  _SectorButtonWidgetState createState() => _SectorButtonWidgetState();
}

class _SectorButtonWidgetState extends State<SectorButtonWidget> {
  BorderRadius _getBorderRadiusPosition() {
    final Radius radius = Radius.circular(999);
    switch (widget.borderRadiusPosition) {
      case 'topLeft':
        return BorderRadius.only(topLeft: radius);
      case 'topRight':
        return BorderRadius.only(topRight: radius);
      case 'bottomLeft':
        return BorderRadius.only(bottomLeft: radius);
      case 'bottomRight':
        return BorderRadius.only(bottomRight: radius);
      default:
        return BorderRadius.circular(999);
    }
  }

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

  @override
  Widget build(BuildContext context) {
    final BorderRadius _borderRadius = _getBorderRadiusPosition();

    return Container(
      width: widget.circleDiameter / 2.0 - 4,
      height: widget.circleDiameter / 2.0 - 4,
      decoration: BoxDecoration(
        color: AppTheme.controlBackgroundColor,
        borderRadius: _borderRadius,
      ),
      child: RawMaterialButton(
        onPressed: () => {
          Vibrate.feedback(FeedbackType.medium),
          _sendCommand(),
        },
        shape: RoundedRectangleBorder(borderRadius: _borderRadius),
        child: Transform.rotate(
          angle: 7 * -math.pi / 4,
          child: Icon(
            widget.icon,
            color: AppTheme.textColor,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
