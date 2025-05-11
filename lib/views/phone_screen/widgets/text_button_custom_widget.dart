import 'package:flutter/material.dart';

class TextButtonCustom extends StatelessWidget {
  const TextButtonCustom({required this.textButton,required this.onPressed, super.key});

  final String textButton;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(textButton, style: TextStyle(color: Colors.blue)),
    );
  }
}