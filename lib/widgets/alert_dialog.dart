import 'package:flutter/material.dart';

class ErrorAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String buttonText;
  final VoidCallback? onButtonPressed;
  const ErrorAlertDialog({
    super.key,
    required this.title,
    required this.content,
    this.buttonText = "OK",
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
      ),
      content: Text(
        content,
      ),
      actions: [
        TextButton(
          onPressed: onButtonPressed ?? () => Navigator.of(context).pop(),
          child: Text(
            buttonText,
          ),
        )
      ],
    );
  }
}
