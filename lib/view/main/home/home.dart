import 'package:flutter/material.dart';

import '../components/buttonnavbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String username = 'Asror'; // Replace with your username variable
  int _selectedIndex = 0; // Track the currently selected index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, 
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Halo, $username',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),), 
            const CircleAvatar(
              backgroundImage: AssetImage(
                  "assets/img/logo.png"), 
              radius: 20, 
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
            'Page berapa coba ini? $_selectedIndex'), 
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped, 
      ),
    );
  }
}
