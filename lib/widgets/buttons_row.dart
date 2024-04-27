import 'package:aoi_remote/widgets/_button_to_list.dart';
import 'package:flutter/material.dart';

class ButtonsRow extends StatelessWidget {
  final List<dynamic> items;
  final String target;

  const ButtonsRow({super.key, required this.items, required this.target});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: items.map((button) {
        return ButtonToList(target: target, button: button);
      }).toList(),
    );
  }
}
