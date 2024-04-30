import 'package:aoi_remote/core/AppTheme.dart';
import 'package:flutter/material.dart';

class BorderPanelWidget extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final double padding;

  const BorderPanelWidget({super.key, required this.children, this.title = '', this.padding = 0.0});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title.isNotEmpty) ...{
          Text(title.toUpperCase(), style: TextStyle(color: AppTheme.textColor)),
          SizedBox(height: 10),
        },
        Container(
          padding: EdgeInsets.all(padding),
          decoration: BoxDecoration(
            color: AppTheme.backgroundColor,
            border: AppTheme.gradientBorder,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Row(
            children: children,
          ),
        ),
      ],
    );
  }
}
