import 'package:flutter/material.dart';
import 'package:aoi_remote/widgets/_button_to_list.dart';

class ButtonsColumn extends StatelessWidget {
  final List<dynamic> items;
  final String target;

  const ButtonsColumn({super.key, required this.items, required this.target});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: items.map((button) {
        return ButtonToList(target: target, button: button);
      }).toList(),
    );
  }
}
