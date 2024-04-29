import 'package:aoi_remote/const/MpcConst.dart';
import 'package:aoi_remote/core/AppTheme.dart';
import 'package:aoi_remote/widgets/CircleButtonWidget.dart';
import 'package:aoi_remote/widgets/CirclePanelWidget.dart';
import 'package:flutter/material.dart';

class MpcPage extends StatefulWidget {
  @override
  _MpcPageState createState() => _MpcPageState();
}

class _MpcPageState extends State<MpcPage> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleButtonWidget(
                      target: MpcConst.NAME,
                      command: MpcConst.EXIT,
                      icon: Icons.power_settings_new_outlined,
                      iconSize: 30.0,
                    ),
                    SizedBox(width: 20),
                    CircleButtonWidget(
                      target: MpcConst.NAME,
                      command: MpcConst.CLOSE,
                      icon: Icons.close_outlined,
                      iconSize: 30.0,
                    ),
                    SizedBox(width: 20),
                    CircleButtonWidget(
                      target: MpcConst.NAME,
                      command: MpcConst.STOP,
                      icon: Icons.stop_outlined,
                      iconSize: 30.0,
                    ),
                    SizedBox(width: 20),
                    CircleButtonWidget(
                      target: MpcConst.NAME,
                      command: MpcConst.FULLSCREEN,
                      icon: Icons.fullscreen_outlined,
                      iconSize: 30.0,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 50),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text('sub'.toUpperCase(), style: TextStyle(color: AppTheme.greyColor)),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: AppTheme.greyDarkColor,
                            border: AppTheme.gradientBorder,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Row(
                            children: [
                              CircleButtonWidget(
                                target: MpcConst.NAME,
                                command: MpcConst.SUB_PREV,
                                icon: Icons.keyboard_arrow_left_outlined,
                                iconSize: 35.0,
                              ),
                              CircleButtonWidget(
                                target: MpcConst.NAME,
                                command: MpcConst.SUN_ON_OFF,
                                icon: Icons.subtitles_off_outlined,
                                iconSize: 35.0,
                              ),
                              CircleButtonWidget(
                                target: MpcConst.NAME,
                                command: MpcConst.SUB_NEXT,
                                icon: Icons.keyboard_arrow_right_outlined,
                                iconSize: 35.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Text('audio'.toUpperCase(), style: TextStyle(color: AppTheme.greyColor)),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: AppTheme.greyDarkColor,
                            border: AppTheme.gradientBorder,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Row(
                            children: [
                              CircleButtonWidget(
                                target: MpcConst.NAME,
                                command: MpcConst.AUDIO_PREV,
                                icon: Icons.keyboard_arrow_left_outlined,
                                iconSize: 35.0,
                              ),
                              CircleButtonWidget(
                                target: MpcConst.NAME,
                                command: MpcConst.AUDIO_ON_OFF,
                                icon: Icons.volume_off_outlined,
                                iconSize: 35.0,
                              ),
                              CircleButtonWidget(
                                target: MpcConst.NAME,
                                command: MpcConst.AUDIO_NEXT,
                                icon: Icons.keyboard_arrow_right_outlined,
                                iconSize: 35.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 35),
                  child: CirclePanelWidget(target: MpcConst.NAME),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text('jump'.toUpperCase(), style: TextStyle(color: AppTheme.greyColor)),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: AppTheme.greyDarkColor,
                            border: AppTheme.gradientBorder,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Row(
                            children: [
                              CircleButtonWidget(
                                target: MpcConst.NAME,
                                command: MpcConst.JUMP_BACKWARD_LARGE,
                                icon: Icons.replay_30_outlined,
                              ),
                              SizedBox(width: 20),
                              CircleButtonWidget(
                                target: MpcConst.NAME,
                                command: MpcConst.JUMP_BACKWARD_MEDIUM,
                                icon: Icons.replay_5_outlined,
                              ),
                              SizedBox(width: 20),
                              CircleButtonWidget(
                                target: MpcConst.NAME,
                                command: MpcConst.JUMP_FORWARD_MEDIUM,
                                icon: Icons.forward_5_outlined,
                              ),
                              SizedBox(width: 20),
                              CircleButtonWidget(
                                target: MpcConst.NAME,
                                command: MpcConst.JUMP_FORWARD_LARGE,
                                icon: Icons.forward_30_outlined,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
