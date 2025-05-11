import 'package:flutter/material.dart';
import 'package:loopi_driver/constants/routs_constants.dart';
import 'package:loopi_driver/views/phone_screen/widgets/button_custom_widget.dart';
import 'package:loopi_driver/views/phone_screen/widgets/otp_code_fields_custom_widget.dart';
import 'package:loopi_driver/views/phone_screen/widgets/text_button_custom_widget.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
     var phoneNumber = ModalRoute.of(context)!.settings.arguments;
     String? otpCode;
    return Scaffold(
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 32, vertical: 88),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Verify your Phone Number',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Enter your 6 digits code numbers sent to you at +2 $phoneNumber . ',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 50),
                  BuildPinCodeFields(otpCode: (code) => otpCode = code),
                  ButtonCustom(
                    textColor: Colors.black,
                    buttonTitle: 'Verify',
                    buttonColor: Colors.grey,
                    onTap: () {
                      
                    },
                  ),
                  TextButtonCustom(
                    textButton: 'Change Phone Number',
                    onPressed:
                        () => Navigator.pushReplacementNamed(
                          context,
                          phoneScreen,
                        ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    
  }
