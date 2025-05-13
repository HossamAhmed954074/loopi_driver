import 'package:flutter/material.dart';
import 'package:loopi_driver/views/home_screen/screens/home_screen.dart';
import 'package:loopi_driver/views/profile_screen/screen/profile_screen.dart';


class BottomNavigationBarCustomWidget extends StatefulWidget {
  const BottomNavigationBarCustomWidget({super.key});

  @override
  State<BottomNavigationBarCustomWidget> createState() => _BottomNavigationBarCustomWidgetState();
}

class _BottomNavigationBarCustomWidgetState extends State<BottomNavigationBarCustomWidget> {
  GlobalKey<ScaffoldState> globalKey = GlobalKey();
 int selectedIndex = 0;
  List<Widget> list = [
    HomeScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
         selectedItemColor: Colors.teal,
            unselectedItemColor: Colors.white,
            backgroundColor: Colors.blueGrey[100],
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,),label: 'Home'),
           BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
        ],
        ),
        body:list.elementAt(selectedIndex),
    );
  }
}