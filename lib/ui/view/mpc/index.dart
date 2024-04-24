import 'package:flutter/material.dart';
import 'package:aoi_remote/ui/widgets/buttons_column.dart';
import '/ui/widgets/buttons_row.dart';
import '/core/media_player.dart';

class MpcPage extends StatelessWidget {
  const MpcPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _setBody();
  }

  Widget _setBody() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Управление ' + 'mpc-hc'.toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          ButtonsColumn(
            items: [
              {'code': MediaPlayer.MPC_EXIT, 'icon': Icons.power_settings_new_outlined, 'size': 40},
            ],
            target: MediaPlayer.MPC,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text('sub'.toUpperCase()),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: const ButtonsColumn(
                      items: [
                        {'code': MediaPlayer.MPC_SUB_PREV, 'icon': Icons.keyboard_arrow_up_outlined},
                        {'code': MediaPlayer.MPC_SUN_ON_OFF, 'icon': Icons.subtitles_off_outlined},
                        {'code': MediaPlayer.MPC_SUB_NEXT, 'icon': Icons.keyboard_arrow_down_outlined},
                      ],
                      target: MediaPlayer.MPC,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text('audio'.toUpperCase()),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: const ButtonsColumn(
                      items: [
                        {'code': MediaPlayer.MPC_AUDIO_PREV, 'icon': Icons.keyboard_arrow_up_outlined},
                        {'code': MediaPlayer.MPC_AUDIO_ON_OFF, 'icon': Icons.volume_off_outlined},
                        {'code': MediaPlayer.MPC_AUDIO_NEXT, 'icon': Icons.keyboard_arrow_down_outlined},
                      ],
                      target: MediaPlayer.MPC,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Column(
            children: [
              ButtonsRow(
                items: [
                  {'code': MediaPlayer.MPC_CLOSE, 'icon': Icons.close_outlined},
                  {'code': MediaPlayer.MPC_STOP, 'icon': Icons.stop_outlined},
                  {'code': MediaPlayer.MPC_PLAY_PAUSE, 'icon': Icons.play_arrow_outlined},
                  {'code': MediaPlayer.MPC_FULLSCREEN, 'icon': Icons.fullscreen_outlined},
                ],
                target: MediaPlayer.MPC,
              ),
            ],
          ),
          const Column(
            children: [
              ButtonsRow(
                items: [
                  {'code': MediaPlayer.MPC_JUMP_BACKWARD_LARGE, 'icon': Icons.replay_30_outlined},
                  {'code': MediaPlayer.MPC_JUMP_BACKWARD_MEDIUM, 'icon': Icons.replay_5_outlined},
                  {'code': MediaPlayer.MPC_JUMP_FORWARD_MEDIUM, 'icon': Icons.forward_5_outlined},
                  {'code': MediaPlayer.MPC_JUMP_FORWARD_LARGE, 'icon': Icons.forward_30_outlined},
                ],
                target: MediaPlayer.MPC,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text('vol'.toUpperCase()),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: const ButtonsColumn(
                      items: [
                        {'code': MediaPlayer.MPC_VOL_UP, 'icon': Icons.add_outlined},
                        {'code': MediaPlayer.MPC_VOL_DOWN, 'icon': Icons.remove_outlined},
                      ],
                      target: MediaPlayer.MPC,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text('file'.toUpperCase()),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: const ButtonsColumn(
                      items: [
                        {'code': MediaPlayer.MPC_NEXT, 'icon': Icons.keyboard_arrow_up_outlined},
                        {'code': MediaPlayer.MPC_PREV, 'icon': Icons.keyboard_arrow_down_outlined},
                      ],
                      target: MediaPlayer.MPC,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
