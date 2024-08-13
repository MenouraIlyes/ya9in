import 'package:flutter/material.dart';
import 'package:ya9in/screens/login_screen.dart';
import 'package:ya9in/screens/sign_up_screen.dart';
import 'package:ya9in/shared/colors.dart';
import 'package:ya9in/widgets/clipper.dart';
import 'package:ya9in/widgets/custom_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Widget getBody() {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(alignment: Alignment.topCenter, children: [
              // clipper
              ClipPath(
                clipper: BottomClipper(),
                child: Container(
                  width: size.width,
                  height: 450,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                ),
              ),
              // photo
              ClipPath(
                clipper: BottomClipper(),
                child: Container(
                  width: size.width,
                  height: 450,
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/mockup.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  // header
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Finding the ',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: 'Perfect Online Course ',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: appSecondary,
                          ),
                        ),
                        TextSpan(
                          text: 'for You',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),

                  // subtitle
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'App to search and discover the most suitable place for you to stay',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[500],
                    ),
                    textAlign: TextAlign.center,
                  ),

                  // button
                  SizedBox(
                    height: 40,
                  ),
                  CustomButtonBox(
                    title: "Let's Get Started",
                    color: appPrimary,
                    isDisabled: false,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ));
                    },
                  ),

                  // Already have an account ?
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 40),
                    child: Row(
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ));
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: appSecondary,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: getBody(),
    );
  }
}
