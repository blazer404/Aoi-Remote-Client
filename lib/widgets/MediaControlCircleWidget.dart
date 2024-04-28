import 'dart:math' as math;

import 'package:aoi_remote/const/AimpConst.dart';
import 'package:aoi_remote/const/MpcConst.dart';
import 'package:aoi_remote/core/AppTheme.dart';
import 'package:aoi_remote/widgets/MediaControlButtonWidget.dart';
import 'package:flutter/material.dart';

class MediaControlCircleWidget extends StatefulWidget {
  final String target;

  const MediaControlCircleWidget({super.key, required this.target});

  @override
  _MediaControlCircleWidgetState createState() => _MediaControlCircleWidgetState();
}

class _MediaControlCircleWidgetState extends State<MediaControlCircleWidget> {
  static const PLAY = 'play';
  static const VOL_UP = 'vol_up';
  static const VOL_DOWN = 'vol_down';
  static const NEXT = 'next';
  static const PREV = 'prev';

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
    return Transform.rotate(
      angle: math.pi / 4,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: AppTheme.controlBackgroundColor,
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Transform.rotate(
              angle: -math.pi / 4,
              child: Container(
                width: 100,
                height: 100,
                child: MediaControlButtonWidget(
                  target: widget.target,
                  command: _getCommand(VOL_UP),
                  iconSize: 45.0,
                  icon: Icons.add_outlined,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Transform.rotate(
              angle: -math.pi / 4,
              child: Container(
                width: 100,
                height: 100,
                child: MediaControlButtonWidget(
                  target: widget.target,
                  command: _getCommand(PREV),
                  iconSize: 45.0,
                  icon: Icons.skip_previous_outlined,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Transform.rotate(
              angle: -math.pi / 4,
              child: Container(
                width: 100,
                height: 100,
                child: MediaControlButtonWidget(
                  target: widget.target,
                  command: _getCommand(NEXT),
                  iconSize: 45.0,
                  icon: Icons.skip_next_outlined,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Transform.rotate(
              angle: -math.pi / 4,
              child: Container(
                width: 100,
                height: 100,
                child: MediaControlButtonWidget(
                  target: widget.target,
                  command: _getCommand(VOL_DOWN),
                  iconSize: 45.0,
                  icon: Icons.remove_outlined,
                ),
              ),
            ),
          ),
          Positioned(
            child: Transform.rotate(
              angle: -math.pi / 4,
              child: Container(
                width: 100,
                height: 100,
                child: MediaControlButtonWidget(
                  target: widget.target,
                  command: _getCommand(PLAY),
                  iconSize: 70.0,
                  icon: Icons.play_arrow_outlined,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
