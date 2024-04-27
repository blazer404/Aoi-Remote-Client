import 'package:aoi_remote/const/AimpConst.dart';
import 'package:aoi_remote/widgets/AppBarWidget.dart';
import 'package:flutter/material.dart';

class AimpPage extends StatefulWidget {
  @override
  _AimpPageState createState() => _AimpPageState();
}

class _AimpPageState extends State<AimpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: AimpConst.TITLE, icon: AimpConst.ICON),
      body: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: const Text('in progress...'),
      ),
    );
  }
}
