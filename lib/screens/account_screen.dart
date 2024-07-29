import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ya9in/datas/account_menu_json.dart';
import 'package:ya9in/providers/user_provider.dart';
import 'package:ya9in/screens/login_screen.dart';
import 'package:ya9in/services/auth.dart';
import 'package:ya9in/shared/colors.dart';
import 'package:ya9in/widgets/custom_button.dart';
import 'package:ya9in/widgets/custom_heading.dart';
import 'package:ya9in/widgets/custom_place_holder.dart';
import 'package:ya9in/widgets/custom_title.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final AuthService _authService = AuthService();

  Future<bool> _confirmSignOut(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: appWhite,
        title: const Text('Confirm Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(
              'Sign Out',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
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
    List items = AccountMenuJson[2]['categories'];
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            SizedBox(height: 30),
            CustomHeading(
              title: 'Account',
              subTitle: '${user!.role}',
              color: Colors.black,
            ),

            // Support
            SizedBox(height: 50),
            CustomTitle(
              title: 'Support',
              extend: false,
            ),
            SizedBox(height: 25),
            Column(
              children: List.generate(
                items.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: CunstomPlaceHolder(
                      title: items[index]['title'],
                    ),
                  );
                },
              ),
            ),

            // Sign in Button
            SizedBox(height: 50),
            CustomButtonBox(
              title: 'LOGOUT',
              isDisabled: false,
              color: Colors.red,
              onTap: () => _handleSignOut(context),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: getBody(context),
    );
  }
}
