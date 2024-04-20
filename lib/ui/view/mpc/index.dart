import 'dart:ui';

import 'package:flutter/material.dart';
import '/core/dictionary.dart';
import '/core/media_player.dart';
import '/ui/widgets/buttons_layout.dart';

class MpcPage extends StatelessWidget {
  const MpcPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Dictionary.MPC_HEADER),
      ),
      body: _setBody(),
    );
  }

  Widget _setBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Text('Основное'),
              ButtonsLayout.createRow(MediaPlayer.MPC, [
                {'code': MediaPlayer.MPC_EXIT, 'icon': Icons.close_outlined},
                {'code': MediaPlayer.MPC_CLOSE, 'icon': Icons.eject_outlined},
                {'code': MediaPlayer.MPC_STOP, 'icon': Icons.stop_outlined},
                {'code': MediaPlayer.MPC_PLAY_PAUSE, 'icon': Icons.play_arrow_outlined},
                {'code': MediaPlayer.MPC_FULLSCREEN, 'icon': Icons.fullscreen_outlined},
              ]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Text('Субтитры'),
                  ButtonsLayout.createRow(MediaPlayer.MPC, [
                    {'code': MediaPlayer.MPC_SUB_PREV, 'icon': Icons.keyboard_arrow_left_outlined},
                    {'code': MediaPlayer.MPC_SUN_ON_OFF, 'icon': Icons.subtitles_off_outlined},
                    {'code': MediaPlayer.MPC_AUDIO_NEXT, 'icon': Icons.keyboard_arrow_right_outlined},
                  ]),
                ],
              ),
              Column(
                children: [
                  const Text('Аудио дорожки'),
                  ButtonsLayout.createRow(MediaPlayer.MPC, [
                    {'code': MediaPlayer.MPC_AUDIO_PREV, 'icon': Icons.keyboard_arrow_left_outlined},
                    {'code': MediaPlayer.MPC_AUDIO_NEXT, 'icon': Icons.keyboard_arrow_right_outlined},
                  ]),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: ButtonsLayout.createColumn(MediaPlayer.MPC, [
                  {'code': MediaPlayer.MPC_VOL_UP, 'icon': Icons.add_outlined},
                  {'code': MediaPlayer.MPC_VOL_DOWN, 'icon': Icons.remove_outlined},
                ]),
              ),
              ButtonsLayout.createColumn(MediaPlayer.MPC, [
                {'code': MediaPlayer.MPC_AUDIO_ON_OFF, 'icon': Icons.volume_off_outlined},
              ]),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: ButtonsLayout.createColumn(MediaPlayer.MPC, [
                  {'code': MediaPlayer.MPC_NEXT, 'icon': Icons.keyboard_arrow_up_outlined},
                  {'code': MediaPlayer.MPC_PREV, 'icon': Icons.keyboard_arrow_down_outlined},
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
