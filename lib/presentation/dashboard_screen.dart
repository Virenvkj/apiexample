import 'package:apiexample/core/auth_service.dart';
import 'package:apiexample/presentation/cart_screen.dart';
import 'package:apiexample/presentation/home_screen.dart';
import 'package:apiexample/presentation/profile_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          if (_selectedIndex == value) return;
          _selectedIndex = value;
          setState(() {});
        },
        currentIndex: _selectedIndex,
        backgroundColor: Colors.yellow,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text("My Store"),
        actions: [
          IconButton(
            onPressed: () async {
              await AuthService.logoutUser(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: _screens[_selectedIndex],
    );
  }
}
