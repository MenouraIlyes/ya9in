import 'package:flutter/material.dart';
import 'package:ya9in/screens/otp_screen.dart';
import 'package:ya9in/shared/colors.dart';
import 'package:ya9in/widgets/custom_button.dart';
import 'package:ya9in/widgets/custom_heading.dart';
import 'package:ya9in/widgets/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  String phoneNumberText = '';

  Widget getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // sign up header
            SizedBox(height: 30),
            CustomHeading(
              title: 'Sign Up',
              color: Colors.black,
              subTitle: 'Welcome To yakin!',
            ),

            // sign up picture
            SizedBox(height: 30),
            Center(
              child: Image.asset(
                'assets/register.png',
                width: 250,
              ),
            ),
            Text(
              'Please verify your phone number to get started.',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: appPrimary,
              ),
            ),

            // phone number textfield
            SizedBox(height: 30),
            CustomTextfield(
              controller: _phoneNumberController,
              labelText: 'Enter Phone Number',
              phoneNumber: true,
              onChanged: (value) {
                setState(() {
                  phoneNumberText = value;
                });
              },
            ),

            // button
            SizedBox(height: 30),
            CustomButtonBox(
              title: 'Continue',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OtpScreen(),
                    ));
              },
              isDisabled: phoneNumberText.length < 9,
            ),

            // divider
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // line
                Expanded(
                  child: Divider(
                    color: Colors.grey[300],
                  ),
                ),
                Text(
                  " Or ",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[400],
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),

            // google sign in box
            SizedBox(height: 20),
            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 58,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // google logo
                    Image.asset(
                      "assets/Google-Logo.png",
                      width: 25,
                    ),
                    Text(
                      'Continue with google',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
              ),
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
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: getBody(),
    );
  }
}
