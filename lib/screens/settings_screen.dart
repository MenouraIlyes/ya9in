import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ya9in/shared/colors.dart';
import 'package:ya9in/widgets/custom_button.dart';
import 'package:ya9in/widgets/custom_profile_menu_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Future<bool> _confirmDeletingAccount(BuildContext context) async {
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
              'Delete your account',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            SizedBox(height: 5),
            Text('Are you sure you want to delete your account?'),
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
                    icon: FontAwesomeIcons.ban,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: CustomButtonBox(
                    title: 'Yes, delete',
                    onTap: () {
                      Navigator.pop(context, true);
                    },
                    isDisabled: false,
                    color: Colors.red,
                    icon: FontAwesomeIcons.trash,
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

  Widget getBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // notification
            CustomProfileMenuWidget(
              icon: Icons.notifications,
              onTap: () {},
              title: 'Notification Settings',
            ),
            Divider(
              indent: 10,
              endIndent: 20,
              color: Colors.grey[200],
            ),

            // password manager
            CustomProfileMenuWidget(
              icon: FontAwesomeIcons.key,
              onTap: () {},
              title: 'Password Manager',
            ),
            Divider(
              indent: 10,
              endIndent: 20,
              color: Colors.grey[200],
            ),

            // delete account
            CustomProfileMenuWidget(
              icon: FontAwesomeIcons.trashCan,
              onTap: () {
                _confirmDeletingAccount(context);
              },
              title: 'Delete Account',
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(
        backgroundColor: appSecondary,
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: appWhite,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: appWhite),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: getBody(context),
    );
  }
}
