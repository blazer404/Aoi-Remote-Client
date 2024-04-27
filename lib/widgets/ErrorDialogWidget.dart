import 'package:flutter/material.dart';

class ErrorDialogWidget extends StatelessWidget {
  final String errorText;

  const ErrorDialogWidget({super.key, required this.errorText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Error'),
      content: Text(this.errorText),
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
