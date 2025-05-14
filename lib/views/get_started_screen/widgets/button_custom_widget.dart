import 'package:flutter/material.dart';
import 'package:loopi_driver/constants/routs_constants.dart';

class ButtonCustomWidget extends StatelessWidget {
  const ButtonCustomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, logInScreen);
      },
      child: Text('Login'),
    );
  }
}