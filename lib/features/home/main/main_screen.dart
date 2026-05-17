import 'package:clothing_app_ui/core/constants/app_colors.dart';
import 'package:clothing_app_ui/features/home/pages/home_page.dart';
import 'package:clothing_app_ui/features/notifications/pages/notifications_screen.dart';
import 'package:clothing_app_ui/features/orders/pages/orders_screen.dart';
import 'package:clothing_app_ui/features/profile/pages/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int currentIndex = 0;

  // Put your 4 existing UI widgets in this list
  final List<Widget> _pages = [
    const HomePage(), 
    const NotificationsScreen(), 
    const OrdersScreen(), 
    const ProfileScreen()
  ];

  // This function is called when a tab is tapped
  void onItemTapped(int index) {
    setState(() {
      currentIndex = index; // Updates the UI to show the new page
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
        
        currentIndex: currentIndex,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed, // Use 'fixed' when you have 4+ items so they don't shift
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.secondaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,  size: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined,  size: 24),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined,  size: 24),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 24,),
            label: 'Profile',
          ),
        ],
      ),
      )
    );
  }
}