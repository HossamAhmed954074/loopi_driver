import 'package:flutter/material.dart';

class DividerCustomWidget extends StatelessWidget {
  const DividerCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(height: 0, thickness: 1, indent: 18, endIndent: 24);
  }
}