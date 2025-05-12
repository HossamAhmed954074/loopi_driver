import 'package:flutter/material.dart';

void snackBarCustom(BuildContext context,String message) {
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }