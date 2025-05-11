import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../constants/colors_constants.dart';

class BuildPinCodeFields extends StatelessWidget {
  const  BuildPinCodeFields({super.key, required this.otpCode});
  final Function(String) otpCode;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      autoFocus: true,
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
      length: 6,
      obscureText: false,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        borderWidth: 1,
        activeColor: MyColor.kBlue,
        inactiveColor: MyColor.kBlue,
        inactiveFillColor: Colors.white,
        activeFillColor: MyColor.kLightBlue,
        selectedColor: MyColor.kBlue,
        selectedFillColor: Colors.white,
      ),
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      onCompleted: otpCode,
      onChanged: (value) {
        print(value);

      },
    );
  }
}