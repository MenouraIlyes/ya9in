import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ya9in/screens/login_screen.dart';
import 'package:ya9in/shared/colors.dart';
import 'package:ya9in/widgets/custom_intro.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  PageController _controller = PageController();

  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    Widget getBody(BuildContext context) {
      return Stack(
        children: [
          //Page view
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              // Screen 1
              CustomIntro(
                title: 'Discover Your Learning Adventure',
                subtitle:
                    'Explore a world of knowledge at your fingertips. Dive into interactive courses tailored to help you achieve your learning goals, anytime, anywhere',
                image: 'assets/discover.png',
              ),
              // Screen 2
              CustomIntro(
                title: 'Connect with Expert Mentors',
                subtitle:
                    "Connect with high-quality mentors who guide you every step of the way. Find expert instructors dedicated to helping you succeed in your learning journey",
                image: 'assets/teachers.png',
              ),
              // Screen 3
              CustomIntro(
                title: 'Track Your Progress',
                subtitle:
                    "Stay on top of your progress. Track your learning journey with personalized insights, milestones, and goals to ensure you're always moving forward.",
                image: 'assets/track.png',
              ),
            ],
          ),

          //Dot indicators
          Container(
            alignment: Alignment(0, 0.90),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Skip
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: appPrimary.withOpacity(0.8)),
                  ),
                ),

                // dot indicator
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: appSecondary,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),

                // next or done
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        },
                        child: Text(
                          "Done",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.8)),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.8)),
                        ),
                      ),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: getBody(context),
    );
  }
}
