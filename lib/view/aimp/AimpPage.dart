import 'package:flutter/material.dart';

class AimpPage extends StatefulWidget {
  @override
  _AimpPageState createState() => _AimpPageState();
}

class _AimpPageState extends State<AimpPage> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: const Text('in progress...'),
        ),
      ),
    );
  }
}
