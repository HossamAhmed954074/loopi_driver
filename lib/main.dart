import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loopi_driver/constants/routs_constants.dart';
import 'package:loopi_driver/cubits/app_theme_cubit/cubit/app_theme_cubit.dart';
import 'package:loopi_driver/cubits/chat_cubit/cubit/chat_cubit.dart';
import 'package:loopi_driver/cubits/home_cubit/cubit/home_cubit.dart';
import 'package:loopi_driver/cubits/login_cubit/cubit/log_in_cubit.dart';
import 'package:loopi_driver/firebase_options.dart';
import 'package:loopi_driver/views/get_started_screen/screens/get_started_screen.dart';
import 'package:loopi_driver/views/home_screen/screens/bottom_navigation.dart';
import 'package:loopi_driver/views/home_screen/screens/home_screen.dart';
import 'package:loopi_driver/views/log_in_screen/screens/log_in_screen.dart';
import 'package:loopi_driver/views/message_screen/screens/message_screen.dart';
import 'package:loopi_driver/views/profile_screen/screen/profile_details.dart';
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
        BlocProvider(create: (context) => AppThemeCubit(),),
        BlocProvider(create: (context) => ChatCubit(),),
        BlocProvider(create: (context) => HomeCubit(),),
        BlocProvider(create: (context) => LogInCubit(),),
        ],
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme:  BlocProvider
                .of<AppThemeCubit>(context)
                .isTheme ? ThemeData.dark() : ThemeData.light(),
            debugShowCheckedModeBanner: false,
            routes: {
              splashScreen: (context) => SplashScreen(),
              homeScreen: (context) => HomeScreen(),
              getStartedScreen: (context) => GetStartedScreen(),
              bootomNavigation: (context) => BottomNavigationBarCustomWidget(),
              messageScreen : (context) => MessageScreen(),
              personalInfoPage : (context) => PersonalInfoPage(),
              logInScreen : (context) => LoginScreen(),
            },
            initialRoute: splashScreen,
          );
        },
      ),
    );
  }
}
