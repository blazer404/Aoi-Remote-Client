import 'dart:math' as math;

import 'package:aoi_remote/const/AimpConst.dart';
import 'package:aoi_remote/const/MpcConst.dart';
import 'package:aoi_remote/core/AppTheme.dart';
import 'package:aoi_remote/widgets/CircleButtonWidget.dart';
import 'package:aoi_remote/widgets/SectorButtonWidget.dart';
import 'package:flutter/material.dart';

class CirclePanelWidget extends StatelessWidget {
  final String target;

  const CirclePanelWidget({super.key, required this.target});

  static const String _PLAY = 'play';
  static const String _VOL_UP = 'vol_up';
  static const String _VOL_DOWN = 'vol_down';
  static const String _NEXT = 'next';
  static const String _PREV = 'prev';

  int _getCommand(String commandName) {
    if (target == MpcConst.NAME) {
      return _getCommandMpc(commandName);
    } else if (target == AimpConst.NAME) {
      return _getCommandAimp(commandName);
    }
    return -1;
  }

  int _getCommandMpc(String commandName) {
    switch (commandName) {
      case _PLAY:
        return MpcConst.PLAY_PAUSE;
      case _VOL_UP:
        return MpcConst.VOL_UP;
      case _VOL_DOWN:
        return MpcConst.VOL_DOWN;
      case _NEXT:
        return MpcConst.NEXT;
      case _PREV:
        return MpcConst.PREV;
    }
    return -1;
  }

  int _getCommandAimp(String commandName) {
    switch (commandName) {
      case _PLAY:
      // return AimpConst.PLAY_PAUSE;
      case _VOL_UP:
      // return AimpConst.VOL_UP;
      case _VOL_DOWN:
      // return AimpConst.VOL_DOWN;
      case _NEXT:
      // return AimpConst.NEXT;
      case _PREV:
      // return AimpConst.PREV;
    }
    return -1;
  }

  @override
  Widget build(BuildContext context) {
    const double circleDiameter = 300.0;

    return Transform.rotate(
      angle: -math.pi / 4,
      child: Container(
        width: circleDiameter,
        height: circleDiameter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          border: AppTheme.gradientCircleBorder,
          color: AppTheme.backgroundColor,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: SectorButtonWidget(
                target: target,
                command: _getCommand(_PREV),
                icon: Icons.skip_previous_outlined,
                circleDiameter: circleDiameter,
                borderRadiusPosition: 'topLeft',
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: SectorButtonWidget(
                target: target,
                command: _getCommand(_NEXT),
                icon: Icons.skip_next_outlined,
                circleDiameter: circleDiameter,
                borderRadiusPosition: 'bottomRight',
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: SectorButtonWidget(
                target: target,
                command: _getCommand(_VOL_UP),
                icon: Icons.add_outlined,
                circleDiameter: circleDiameter,
                borderRadiusPosition: 'topRight',
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: SectorButtonWidget(
                target: target,
                command: _getCommand(_VOL_DOWN),
                icon: Icons.remove_outlined,
                circleDiameter: circleDiameter,
                borderRadiusPosition: 'bottomLeft',
              ),
            ),
            Positioned(
              child: Transform.rotate(
                angle: math.pi / 4,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    border: AppTheme.gradientBorder,
                    color: AppTheme.backgroundColor,
                    boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 15.0, blurStyle: BlurStyle.outer)],
                  ),
                  child: CircleButtonWidget(
                    target: target,
                    command: _getCommand(_PLAY),
                    icon: Icons.play_arrow_outlined,
                    iconSize: 75.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
