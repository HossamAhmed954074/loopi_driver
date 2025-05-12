import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loopi_driver/constants/routs_constants.dart';
import 'package:loopi_driver/cubits/phone_cubit/phone_auth_cubit.dart';
import 'package:loopi_driver/views/phone_screen/widgets/progress_indecator.dart';
import 'package:loopi_driver/views/phone_screen/widgets/snack_par_custom_widget.dart';
import 'package:loopi_driver/views/phone_screen/widgets/text_form_field_custom.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> globalKey = GlobalKey();
    // ignore: unused_local_variable
    late String phoneNumber;
    final TextEditingController phoneController = TextEditingController();
    return SafeArea(
      child: BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
        listener: (context, state) {
          if(state is PhoneAuthLoading){
            return showProgressIndecator(context);
          }if(state is PhoneAuthFaluire){
            Navigator.pop(context);
            return snackBarCustom(context, state.errorMessage);
          }if(state is PhoneAuthSuccess){
            Navigator.pop(context);
            snackBarCustom(context, 'عملية صحيحة');
            Navigator.pushReplacementNamed(
            context,
            otpScreen,
            arguments: phoneNumber,
          );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Form(
              key: globalKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    const Text(
                      'ما هو رقم هاتفك؟',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F6C9E),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '. من فضلك أدخل رقم هاتفك لتأكيد حسابك',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 32),
                    TextFormFieldCustom(
                      phoneController: phoneController,
                      labelTitle: 'رقم الهاتف',
                      onChanged: (val) => phoneNumber = val,
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0F6C9E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        if (globalKey.currentState!.validate()) {
                          phoneController.clear();
                          BlocProvider.of<PhoneAuthCubit>(context).submitedPhoneNumber(phoneNumber);
                       
                        }
                      },
                      child: const Text(
                        'إرسال',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white, // ← لون النص أبيض
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
