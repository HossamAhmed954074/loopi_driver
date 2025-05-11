import 'package:flutter/material.dart';
import 'package:loopi_driver/views/get_started_screen/widgets/button_custom_widget.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff464C51),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/loopi.png'),
          Text(
            'An app for drivers to manage trips,',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'view schedules, track buses,',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'and receive updates efficiently.',
            style: TextStyle(color: Colors.white),
          ), //Spacer(),
          SizedBox(height: 30),
          ButtonCustomWidget(),
        ],
      ),
    );
  }
}


