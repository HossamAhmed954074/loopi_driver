import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loopi_driver/constants/routs_constants.dart';
import 'package:loopi_driver/cubits/phone_cubit/phone_auth_cubit.dart';
import 'package:loopi_driver/views/phone_screen/widgets/button_custom_widget.dart';
import 'package:loopi_driver/views/phone_screen/widgets/otp_code_fields_custom_widget.dart';
import 'package:loopi_driver/views/phone_screen/widgets/progress_indecator.dart';
import 'package:loopi_driver/views/phone_screen/widgets/snack_par_custom_widget.dart';
import 'package:loopi_driver/views/phone_screen/widgets/text_button_custom_widget.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var phoneNumber = ModalRoute.of(context)!.settings.arguments;
    String? otpCode;
    return BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
      listener: (context, state) {
        if(state is PhoneAuthLoading){
          return showProgressIndecator(context);
        }if(state is PhoneAuthFaluire){
              Navigator.pop(context);
            return snackBarCustom(context, state.errorMessage);
        }if(state is PhoneOtpVerified){
          Navigator.pop(context);
          snackBarCustom(context, 'تم ألتأكيد');
          Navigator.pushReplacementNamed(context, bootomNavigation);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 32, vertical: 88),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'تأكيد رقم الهاتف',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(height: 30),
                  Text(
                    'أدخل 6 أرقام التي وصلت علي رقم ',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      '+2 $phoneNumber',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: 50),
                  BuildPinCodeFields(otpCode: (code) => otpCode = code),
                  ButtonCustom(
                    textColor: Colors.black,
                    buttonTitle: 'تأكيد',
                    buttonColor: Colors.grey,
                    onTap: () {
                    BlocProvider.of<PhoneAuthCubit>(context).submitedOTP(otpCode!);
                    },
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButtonCustom(
                      textButton: 'تغيير رقم الهاتف',
                      onPressed:
                          () => Navigator.pushReplacementNamed(
                            context,
                            phoneScreen,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
