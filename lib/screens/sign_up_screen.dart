import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ya9in/services/phone_verification_provider.dart';
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

  Country selectedCountry = Country(
    phoneCode: '213',
    countryCode: "DZ",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'Algeria',
    example: 'Algeria',
    displayName: 'Algeria',
    displayNameNoCountryCode: 'DZ',
    e164Key: '',
  );

  // Phone number sign in
  void sendPhoneNumber() {
    final ap = Provider.of<PhoneVerification>(context, listen: false);
    String phoneNumber = phoneNumberText.trim();
    ap.continueWithPhone(context, '+${selectedCountry.phoneCode}$phoneNumber');
  }

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
              color: appPrimary,
              onTap: () {
                sendPhoneNumber();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      "We'll redirect you to a page to verify that you're not a robot."),
                  backgroundColor: Colors.green,
                ));
              },
              isDisabled: phoneNumberText.length < 9,
            ),
            const SizedBox(height: 30),
            Center(
              child: GestureDetector(
                onTap: Navigator.of(context).pop,
                child: Text(
                  "Go back",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: appSecondary,
                  ),
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
