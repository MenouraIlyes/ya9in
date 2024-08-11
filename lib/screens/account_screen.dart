import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ya9in/providers/user_provider.dart';
import 'package:ya9in/screens/login_screen.dart';
import 'package:ya9in/screens/profile_screen.dart';
import 'package:ya9in/services/auth.dart';
import 'package:ya9in/shared/colors.dart';
import 'package:ya9in/widgets/clipper.dart';
import 'package:ya9in/widgets/custom_button.dart';
import 'package:ya9in/widgets/custom_heading.dart';
import 'package:ya9in/widgets/custom_profile_menu_widget.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final AuthService _authService = AuthService();

  Future<bool> _confirmSignOut(BuildContext context) async {
    final result = await showModalBottomSheet<bool>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: appWhite,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            SizedBox(height: 5),
            Text('Are you sure you want to log out?'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: CustomButtonBox(
                    title: 'Cancel',
                    onTap: () {
                      Navigator.pop(context, false);
                    },
                    isDisabled: false,
                    color: Colors.grey[500]!,
                    icon: Icons.cancel_sharp,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: CustomButtonBox(
                    title: 'Yes, Logout',
                    onTap: () {
                      Navigator.pop(context, true);
                    },
                    isDisabled: false,
                    color: Colors.red,
                    icon: Icons.logout,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    return result ?? false;
  }

  Future<void> _handleSignOut(BuildContext context) async {
    bool shouldSignOut = await _confirmSignOut(context);
    if (shouldSignOut) {
      await _authService.signOut(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }
  }

  Widget getBody(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // background
          Stack(
            alignment: Alignment.topCenter,
            children: [
              ClipPath(
                clipper: BottomClipper(),
                child: Container(
                  width: size.width,
                  height: 320,
                  decoration: BoxDecoration(
                    color: appSecondary,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Column(children: [
                  SizedBox(height: 60),
                  // Heading
                  CustomHeading(
                    title: 'Account',
                    subTitle: '',
                    color: appWhite,
                  ),

                  // profile details
                  Container(
                    height: 100,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset('assets/pfp.jpg'),
                    ),
                  ),

                  // user name and role
                  SizedBox(height: 10),
                  Text(
                    user!.name,
                    style: TextStyle(
                      color: appWhite,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    user.role,
                    style: TextStyle(
                      color: appWhite,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ]),
              ),
            ],
          ),

          SizedBox(height: 20),

          // your profile
          CustomProfileMenuWidget(
            icon: Icons.person,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ));
            },
            title: 'Your Profile',
          ),

          // payment methods
          CustomProfileMenuWidget(
            icon: Icons.credit_card,
            onTap: () {},
            title: 'Payment Methods',
          ),

          // settings
          CustomProfileMenuWidget(
            icon: Icons.settings,
            onTap: () {},
            title: 'Settings',
          ),

          // Support
          CustomProfileMenuWidget(
            icon: Icons.support,
            onTap: () {},
            title: 'Support',
          ),

          // About us
          CustomProfileMenuWidget(
            icon: Icons.contact_support,
            onTap: () {},
            title: 'About Us',
          ),

          // Sign out Button
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 10),
            child: CustomButtonBox(
              title: 'LOGOUT',
              isDisabled: false,
              color: Colors.red,
              onTap: () => _handleSignOut(context),
              icon: Icons.logout,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: getBody(context),
    );
  }
}
