import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ya9in/models/user_info.dart';
import 'package:ya9in/providers/user_provider.dart';
import 'package:ya9in/root_app.dart';
import 'package:ya9in/shared/colors.dart';
import 'package:ya9in/widgets/custom_button.dart';
import 'package:ya9in/widgets/custom_heading.dart';
import 'package:ya9in/widgets/custom_textfield.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final TextEditingController _nameController = TextEditingController();
  String nameText = '';
  String selectedRole = 'Student';

  // Store user info
  void _addUserInfo() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final user = UserModel(
      name: _nameController.text,
      age: age.toString(),
      role: selectedRole,
    );
    await userProvider.addUser(user);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => RootApp(),
      ),
      (route) => false,
    );
  }

  // ROLE
  void openRoleSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  'Select your Role',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: appPrimary,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Divider(
                indent: 25,
                endIndent: 25,
                color: appPrimary,
              ),
              ListTile(
                leading: Image.asset(
                  "assets/student.png",
                  width: 100,
                ),
                title: Text(
                  'Student',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context, 'Student');
                },
              ),
              Divider(
                indent: 25,
                endIndent: 25,
                color: appPrimary,
              ),
              ListTile(
                leading: Image.asset(
                  "assets/teacher.png",
                  width: 100,
                ),
                title: Text(
                  'Professor',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context, 'Professor');
                },
              ),
              Divider(
                indent: 25,
                endIndent: 25,
                color: appPrimary,
              ),
            ],
          ),
        );
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedRole = value;
        });
      }
    });
  }

  // AGE
  void openAgeSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  'Select your Age',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: appPrimary,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Divider(
                indent: 25,
                endIndent: 25,
                color: appPrimary,
              ),
              ListTile(
                title: Text(
                  'Pick Date of Birth',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _selectDate(context);
                },
              ),
              Divider(
                indent: 25,
                endIndent: 25,
                color: appPrimary,
              ),
            ],
          ),
        );
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          age = value;
        });
      }
    });
  }

  DateTime? selectedDate;
  int? age = 18;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        age = _calculateAge(picked);
      });
    }
  }

  int _calculateAge(DateTime birthDate) {
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            // header
            SizedBox(height: 30),
            CustomHeading(
              title: 'Personal Information',
              color: Colors.black,
              subTitle:
                  'Please fill up the form below with your informations to get you started!',
            ),

            // Illustration
            SizedBox(height: 30),
            Center(
              child: Image.asset(
                'assets/info.png',
                width: 250,
              ),
            ),

            // Name
            SizedBox(height: 20),
            CustomTextfield(
              controller: _nameController,
              labelText: 'Name',
              onChanged: (value) {
                setState(() {
                  nameText = value;
                });
              },
            ),

            // Age
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              width: MediaQuery.of(context).size.width,
              height: 70,
              decoration: BoxDecoration(
                color: appSecondary,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        age.toString(),
                        style: TextStyle(
                          fontSize: 19,
                          color: appWhite,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          openAgeSelection(context);
                        },
                        child: Text(
                          "Change",
                          style: TextStyle(
                            fontSize: 18,
                            color: appWhite,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            // Role
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              width: MediaQuery.of(context).size.width,
              height: 70,
              decoration: BoxDecoration(
                color: appSecondary,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedRole,
                        style: TextStyle(
                          fontSize: 19,
                          color: appWhite,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          openRoleSelection(context);
                        },
                        child: Text(
                          "Change",
                          style: TextStyle(
                            fontSize: 18,
                            color: appWhite,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            // confirm Button
            SizedBox(height: 30),
            CustomButtonBox(
              title: 'Confirm',
              color: appPrimary,
              onTap: () {
                _addUserInfo();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RootApp(),
                  ),
                  (route) => false,
                );
              },
              isDisabled: nameText.isEmpty,
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
        automaticallyImplyLeading: false,
      ),
      body: getBody(),
    );
  }
}
