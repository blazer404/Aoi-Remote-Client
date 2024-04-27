import 'package:aoi_remote/const/MpcConst.dart';
import 'package:aoi_remote/widgets/AppBarWidget.dart';
import 'package:aoi_remote/widgets/buttons_column.dart';
import 'package:aoi_remote/widgets/buttons_row.dart';
import 'package:flutter/material.dart';

class MpcPage extends StatefulWidget {
  @override
  _MpcPageState createState() => _MpcPageState();
}

class _MpcPageState extends State<MpcPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(title: MpcConst.TITLE, icon: MpcConst.ICON),
        body: Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonsColumn(
                items: [
                  {'code': MpcConst.EXIT, 'icon': Icons.power_settings_new_outlined, 'size': 40},
                ],
                target: MpcConst.NAME,
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
                            {'code': MpcConst.SUB_PREV, 'icon': Icons.keyboard_arrow_up_outlined},
                            {'code': MpcConst.SUN_ON_OFF, 'icon': Icons.subtitles_off_outlined},
                            {'code': MpcConst.SUB_NEXT, 'icon': Icons.keyboard_arrow_down_outlined},
                          ],
                          target: MpcConst.NAME,
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
                            {'code': MpcConst.AUDIO_PREV, 'icon': Icons.keyboard_arrow_up_outlined},
                            {'code': MpcConst.AUDIO_ON_OFF, 'icon': Icons.volume_off_outlined},
                            {'code': MpcConst.AUDIO_NEXT, 'icon': Icons.keyboard_arrow_down_outlined},
                          ],
                          target: MpcConst.NAME,
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
                      {'code': MpcConst.CLOSE, 'icon': Icons.close_outlined},
                      {'code': MpcConst.STOP, 'icon': Icons.stop_outlined},
                      {'code': MpcConst.PLAY_PAUSE, 'icon': Icons.play_arrow_outlined},
                      {'code': MpcConst.FULLSCREEN, 'icon': Icons.fullscreen_outlined},
                    ],
                    target: MpcConst.NAME,
                  ),
                ],
              ),
              const Column(
                children: [
                  ButtonsRow(
                    items: [
                      {'code': MpcConst.JUMP_BACKWARD_LARGE, 'icon': Icons.replay_30_outlined},
                      {'code': MpcConst.JUMP_BACKWARD_MEDIUM, 'icon': Icons.replay_5_outlined},
                      {'code': MpcConst.JUMP_FORWARD_MEDIUM, 'icon': Icons.forward_5_outlined},
                      {'code': MpcConst.JUMP_FORWARD_LARGE, 'icon': Icons.forward_30_outlined},
                    ],
                    target: MpcConst.NAME,
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
                            {'code': MpcConst.VOL_UP, 'icon': Icons.add_outlined},
                            {'code': MpcConst.VOL_DOWN, 'icon': Icons.remove_outlined},
                          ],
                          target: MpcConst.NAME,
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
                            {'code': MpcConst.NEXT, 'icon': Icons.keyboard_arrow_up_outlined},
                            {'code': MpcConst.PREV, 'icon': Icons.keyboard_arrow_down_outlined},
                          ],
                          target: MpcConst.NAME,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
