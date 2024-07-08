import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ya9in/screens/account_screen.dart';
import 'package:ya9in/screens/course_screen.dart';
import 'package:ya9in/screens/explore_screen.dart';
import 'package:ya9in/screens/home_screen.dart';
import 'package:ya9in/shared/colors.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int _selectedIndex = 0;

  // pages
  final List<Widget> pages = [
    HomeScreen(),
    CourseScreen(),
    ExploreScreen(),
    AccountScreen(),
  ];

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<GButton> tabs = [
    // home
    GButton(
      icon: Icons.home_filled,
      text: 'Home',
    ),

    // course
    GButton(
      icon: Icons.play_arrow_rounded,
      text: 'Course',
    ),
    // idk
    GButton(
      icon: Icons.explore,
      text: 'Explore',
    ),
    GButton(
      icon: Icons.account_circle_rounded,
      text: 'Account',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        gap: 8,
        backgroundColor: Colors.white,
        color: Colors.black,
        activeColor: appPrimary,
        onTabChange: (index) {
          _navigateBottomBar(index);
        },
        tabs: tabs,
      ),
      body: pages[_selectedIndex],
    );
  }
}
