import 'package:flutter/material.dart';

class ErrorDialogWidget extends StatefulWidget {
  final String errorText;

  const ErrorDialogWidget({super.key, required this.errorText});

  @override
  _ErrorDialogWidgetState createState() => _ErrorDialogWidgetState();
}

class _ErrorDialogWidgetState extends State<ErrorDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Error'),
      content: Text(widget.errorText),
      actions: <Widget>[
        TextButton(
          child: Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
