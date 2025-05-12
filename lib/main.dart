import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loopi_driver/constants/routs_constants.dart';
import 'package:loopi_driver/cubits/phone_cubit/phone_auth_cubit.dart';
import 'package:loopi_driver/firebase_options.dart';
import 'package:loopi_driver/views/get_started_screen/screens/get_started_screen.dart';
import 'package:loopi_driver/views/home_screen/screens/home_screen.dart';
import 'package:loopi_driver/views/phone_screen/screens/otp_screen.dart';
import 'package:loopi_driver/views/phone_screen/screens/phone_screen.dart';
import 'package:loopi_driver/views/splash_screen/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const LoopiDriver());
}

class LoopiDriver extends StatelessWidget {
  const LoopiDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PhoneAuthCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          splashScreen: (context) => SplashScreen(),
          homeScreen: (context) => HomeScreen(),
          getStartedScreen: (context) => GetStartedScreen(),
          phoneScreen: (context) => PhoneScreen(),
          otpScreen: (context) => OtpScreen(),
        },
        initialRoute: splashScreen,
      ),
    );
  }
}
