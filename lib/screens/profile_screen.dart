import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ya9in/providers/user_provider.dart';
import 'package:ya9in/shared/colors.dart';
import 'package:ya9in/widgets/custom_button.dart';
import 'package:ya9in/widgets/custom_textfield.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  late Future<void> _fetchUserFuture;

  @override
  void initState() {
    super.initState();
    _fetchUserFuture =
        Provider.of<UserProvider>(context, listen: false).fetchUser();
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: FutureBuilder<void>(
            future: _fetchUserFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final userProvider = Provider.of<UserProvider>(context);
                final user = userProvider.user;
                if (user == null) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Profile picture
                      SizedBox(height: 30),
                      Stack(children: [
                        Center(
                          child: Container(
                            height: 120,
                            width: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset('assets/pfp.jpg'),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 100,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: appSecondary,
                            ),
                            child: const Icon(
                              Icons.mode,
                              color: appWhite,
                              size: 20,
                            ),
                          ),
                        )
                      ]),

                      // Name
                      SizedBox(
                        height: 50,
                      ),
                      CustomTextfield(
                        controller: _nameController,
                        labelText: user.name,
                      ),

                      // Phone number
                      SizedBox(
                        height: 30,
                      ),
                      CustomTextfield(
                        controller: _phoneNumberController
                          ..text = user.phoneNumber ?? '',
                        labelText: 'Phone Number',
                      ),

                      // email
                      SizedBox(
                        height: 30,
                      ),
                      CustomTextfield(
                        controller: _emailController..text = user.email ?? '',
                        labelText: 'Email',
                      ),
                    ],
                  );
                }
              }
            }),
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
          'Your Profile',
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 1.0,
            spreadRadius: 1.0,
            offset: Offset(0.0, -1.0),
          )
        ]),
        child: BottomAppBar(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          notchMargin: 0,
          color: appWhite,
          surfaceTintColor: Colors.white,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                left: 5,
              ),
              child: Column(
                children: [
                  // Submit button
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: CustomButtonBox(
                      color: appPrimary,
                      title: 'Update Profile',
                      isDisabled: false,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
      body: getBody(),
    );
  }
}
