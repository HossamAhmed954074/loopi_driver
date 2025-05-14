import 'package:flutter/material.dart';
import 'package:loopi_driver/constants/colors_constants.dart';

// ignore: must_be_immutable
class BubbleChatGet extends StatelessWidget {
  BubbleChatGet({required this.masseage, super.key});
  String masseage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        padding: EdgeInsets.only(top: 14, bottom: 14, right: 10, left: 14),
        decoration: BoxDecoration(
          color: MyColor.kbubbleColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        child: Text(masseage, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}