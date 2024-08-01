import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:ya9in/providers/user_provider.dart';
import 'package:ya9in/screens/account_screen.dart';
import 'package:ya9in/screens/courses_screen.dart';
import 'package:ya9in/screens/explore_screen.dart';
import 'package:ya9in/screens/home_screen.dart';
import 'package:ya9in/screens/prof_course_screen.dart';
import 'package:ya9in/shared/colors.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    bool isProfessor = user != null && user.role == 'Professor';

    // pages
    final List<Widget> pages = [
      HomeScreen(),
      if (isProfessor) ProfCourseScreen() else CourseScreen(),
      ExploreScreen(),
      AccountScreen(),
    ];

    final List<GButton> tabs = [
      // home
      GButton(
        icon: Icons.home_filled,
        text: 'Home',
      ),
      // courses
      GButton(
        icon: Icons.play_circle_outline,
        text: 'Courses',
      ),
      // explore
      GButton(
        icon: Icons.explore,
        text: 'Explore',
      ),
      // account infos
      GButton(
        icon: Icons.account_circle_rounded,
        text: 'Account',
      ),
    ];

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
