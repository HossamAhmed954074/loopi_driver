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


   int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() => _currentIndex = index);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list.elementAt(_currentIndex),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _currentIndex,
        onItemTapped: _onTabTapped,
      ),
    );
  }
}


class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      child: BottomAppBar(
        color: const Color(0xFF136D9E), // Your blue color
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: Icons.home_outlined,
                label: 'Home',
                index: 0,
              ),
              _buildNavItem(
                icon: Icons.person_outline,
                label: 'Profile',
                index: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xFF136D9E) : Colors.white,
              size: 24,
            ),
            if (label.isNotEmpty && isSelected) ...[
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  color: Color(0xFF136D9E),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}









// class BottomNavigationBarCustomWidget extends StatefulWidget {
//   const BottomNavigationBarCustomWidget({super.key});

//   @override
//   State<BottomNavigationBarCustomWidget> createState() => _BottomNavigationBarCustomWidgetState();
// }

// class _BottomNavigationBarCustomWidgetState extends State<BottomNavigationBarCustomWidget> {
//   GlobalKey<ScaffoldState> globalKey = GlobalKey();
//  int selectedIndex = 0;
//   List<Widget> list = [
//     HomeScreen(),
//     ProfileScreen(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: selectedIndex,
//         onTap: (value) {
//           setState(() {
//             selectedIndex = value;
//           });
//         },
//          selectedItemColor: Colors.teal,
//             unselectedItemColor: Colors.white,
//             backgroundColor: Colors.blueGrey[100],
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home,),label: 'Home'),
//            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
//         ],
//         ),
//         body:list.elementAt(selectedIndex),
//     );
//   }
// }