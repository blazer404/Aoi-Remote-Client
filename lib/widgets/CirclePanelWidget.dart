import 'dart:math' as math;

import 'package:aoi_remote/const/AimpConst.dart';
import 'package:aoi_remote/const/MpcConst.dart';
import 'package:aoi_remote/core/AppTheme.dart';
import 'package:aoi_remote/widgets/CircleButtonWidget.dart';
import 'package:aoi_remote/widgets/SectorButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class CirclePanelWidget extends StatefulWidget {
  final String target;

  const CirclePanelWidget({super.key, required this.target});

  @override
  _CirclePanelWidgetState createState() => _CirclePanelWidgetState();
}

class _CirclePanelWidgetState extends State<CirclePanelWidget> {
  static const double circleDiameter = 350.0;
  static const String PLAY = 'play';
  static const String VOL_UP = 'vol_up';
  static const String VOL_DOWN = 'vol_down';
  static const String NEXT = 'next';
  static const String PREV = 'prev';

  _getCommand(String commandName) {
    if (widget.target == MpcConst.NAME) {
      return _getCommandMpc(commandName);
    } else if (widget.target == AimpConst.NAME) {
      return _getCommandAimp(commandName);
    }
  }

  _getCommandMpc(String commandName) {
    switch (commandName) {
      case PLAY:
        return MpcConst.PLAY_PAUSE;
      case VOL_UP:
        return MpcConst.VOL_UP;
      case VOL_DOWN:
        return MpcConst.VOL_DOWN;
      case NEXT:
        return MpcConst.NEXT;
      case PREV:
        return MpcConst.PREV;
    }
  }

  _getCommandAimp(String commandName) {
    switch (commandName) {
      case PLAY:
      // return AimpConst.PLAY_PAUSE;
      case VOL_UP:
      // return AimpConst.VOL_UP;
      case VOL_DOWN:
      // return AimpConst.VOL_DOWN;
      case NEXT:
      // return AimpConst.NEXT;
      case PREV:
      // return AimpConst.PREV;
    }
  }

  @override
  Widget build(BuildContext context) {
    final LinearGradient gradient = LinearGradient(
      begin: Alignment.center,
      end: Alignment.topRight,
      colors: [
        Colors.blue.withOpacity(.7),
        Colors.purple.withOpacity(.7),
        Colors.red.withOpacity(.7),
      ],
    );

    return Transform.rotate(
      angle: -math.pi / 4,
      child: Container(
        width: circleDiameter,
        height: circleDiameter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          border: GradientBoxBorder(gradient: gradient, width: 4),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: SectorButtonWidget(
                target: widget.target,
                command: _getCommand(PREV),
                icon: Icons.skip_previous_outlined,
                circleDiameter: circleDiameter,
                borderRadiusPosition: 'topLeft',
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: SectorButtonWidget(
                target: widget.target,
                command: _getCommand(NEXT),
                icon: Icons.skip_next_outlined,
                circleDiameter: circleDiameter,
                borderRadiusPosition: 'bottomRight',
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: SectorButtonWidget(
                target: widget.target,
                command: _getCommand(VOL_UP),
                icon: Icons.add_outlined,
                circleDiameter: circleDiameter,
                borderRadiusPosition: 'topRight',
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: SectorButtonWidget(
                target: widget.target,
                command: _getCommand(VOL_DOWN),
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
                    border: GradientBoxBorder(gradient: gradient, width: 4),
                    color: AppTheme.controlBackgroundColor,
                  ),
                  child: CircleButtonWidget(
                    target: widget.target,
                    command: _getCommand(PLAY),
                    icon: Icons.play_arrow_outlined,
                    iconSize: 80.0,
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
