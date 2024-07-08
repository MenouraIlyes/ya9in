import 'package:flutter/material.dart';
import 'package:ya9in/shared/colors.dart';
import 'package:ya9in/widgets/clipper.dart';
import 'package:ya9in/widgets/custom_category_card.dart';
import 'package:ya9in/widgets/custom_search_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          // background
          Stack(
            alignment: Alignment.topCenter,
            children: [
              ClipPath(
                clipper: BottomClipper(),
                child: Container(
                  width: size.width,
                  height: 300,
                  decoration: BoxDecoration(
                    color: appSecondary,
                  ),
                ),
              ),

              // rest of the body
              Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: Column(
                  children: [
                    SizedBox(height: 74),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Welcome Text Username
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Hi, Menoura',
                                style: TextStyle(
                                  color: appWhite,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "Let's start learning",
                                style: TextStyle(
                                  color: appWhite,
                                  fontSize: 15,
                                ),
                              ),
                            ]),

                        // Username Icon
                        Container(
                          height: 80,
                          width: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset('assets/pfp.jpg'),
                          ),
                        ),
                      ],
                    ),

                    // search field
                    SizedBox(height: 50),
                    CustomSearchField(
                      hintField: "Try 'Web Design'",
                      backgroundColor: appWhite,
                    ),

                    // categories
                    SizedBox(height: 20),
                    CustomCategoryCard(),
                  ],
                ),
              )
            ],
          ),
        ],
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
      ),
      body: getBody(),
    );
  }
}
