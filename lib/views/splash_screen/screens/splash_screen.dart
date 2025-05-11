import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loopi_driver/constants/colors_constants.dart';
import 'package:loopi_driver/constants/routs_constants.dart';
import 'package:loopi_driver/main.dart';
import 'package:loopi_driver/views/splash_screen/widgets/slide_text_animation.dart';


late String authUser;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  
  @override
  void initState() {
    initSlidingAnimation();
    
    super.initState();
    Future.delayed(const Duration(seconds: 2),() {
       FirebaseAuth.instance.authStateChanges().listen((user) {
    if (user == null) {
      Navigator.pushReplacementNamed(context, getStartedScreen);
    } else {
      if(user.email != null){
        authUser = user.email!;
      }else if(user.phoneNumber != null){
        authUser = user.phoneNumber!;
      }
       Navigator.pushReplacementNamed(context, homeScreen);
    }
  });
    },);
  }

  void initSlidingAnimation() {
     animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    slidingAnimation = Tween<Offset>(
      begin: Offset(0, 4),
      end: Offset(0, 0),
    ).animate(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.kPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/loopi.png'),
          SlideText(slidingAnimation: slidingAnimation),
        ],
      ),
    );
  }
}


