import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.work),
          label: 'open',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.lock_person),
          label: 'private',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.car_rental_outlined),
          label: 'rental',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      onTap: onItemTapped,
      selectedIconTheme: const IconThemeData(
        size: 30,
      ),
      unselectedIconTheme: const IconThemeData(
        size: 20,
      ),
    );
  }
}
