import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loopi_driver/constants/colors_constants.dart';
import 'package:loopi_driver/constants/routs_constants.dart';
import 'package:loopi_driver/cubits/login_cubit/cubit/log_in_cubit.dart';
import 'package:loopi_driver/views/log_in_screen/widgets/log_in_button.dart';
import 'package:loopi_driver/views/log_in_screen/widgets/log_in_text_field.dart';
import 'package:loopi_driver/views/log_in_screen/widgets/snack_par_custom_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInCubit, LogInState>(
      listener: (context, state) {
        if (state is LogInLoading) {
          isLoading = true;
        } else if (state is LogInSuccess) {
          Navigator.pushReplacementNamed(context, homeScreen);
          isLoading = false;
        } else if (state is LogInFaluire) {
          snackBarCustom(context, state.errorMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            appBar: AppBar(),
            body: SizedBox(
              width: double.infinity,
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 40),
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 40),
                      LogInTextFormFieldCustom(
                        labelTitle: 'Email',
                        onChanged: (val) {
                          email = val;
                        },
                      ),
                      LogInTextFormFieldCustom(
                        labelTitle: 'Password',
                        onChanged: (val) {
                          password = val;
                        },
                      ),
                      SizedBox(height: 10),
                      LogInButtonCustom(
                        buttonTitle: 'Login',
                        buttonColor: MyColor.kButtonLoginColor,
                        textColor: Colors.white,
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<LogInCubit>(
                              context,
                            ).loginUser(email: email!, password: password!);
                          } else {}
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}