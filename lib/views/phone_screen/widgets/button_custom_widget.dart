import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    required this.buttonTitle,
    required this.buttonColor,
    required this.textColor,
    required this.onTap,
    super.key,
  });
  final String buttonTitle;
  final Color buttonColor;
  final Color textColor;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(32),
          ),
          width: double.infinity,
          height: 50,
          child: Center(
            child: Text(
              buttonTitle,
              style: TextStyle(color: textColor, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}