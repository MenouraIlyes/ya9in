import 'package:flutter/material.dart';
import 'package:ya9in/models/lesson.dart';
import 'package:ya9in/shared/colors.dart';
import 'package:ya9in/widgets/custom_categories_button.dart';
import 'package:ya9in/widgets/custom_heading.dart';
import 'package:ya9in/widgets/custom_lesson_card.dart';
import 'package:ya9in/widgets/custom_tab_view.dart';

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen({super.key});

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  int _selectedTag = 0;

  void changeTab(int index) {
    setState(() {
      _selectedTag = index;
    });
  }

  Widget getBody() {
    return Container(
      // background color
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            appPrimary,
            appTeriatery,
          ],
        ),
      ),
      child: Column(
        children: [
          // Top section
          Container(
            padding: EdgeInsets.only(top: 50, left: 30, right: 30),
            width: MediaQuery.of(context).size.width,
            height: 350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // back button
                Opacity(
                  opacity: 0.8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: appTeriatery,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: appWhite,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // title of the course
                CustomHeading(
                  title: 'Web Apps with React and Firebase Introduction',
                  subTitle: 'Created by Jonathan',
                  color: appWhite,
                ),

                SizedBox(height: 10),
                Row(
                  children: [
                    // rating
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: CustomCategoriesButton(
                        title: '4.8',
                        icon: Icons.star,
                      ),
                    ),

                    // number of hours
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: CustomCategoriesButton(
                        title: '68 hours',
                        icon: Icons.watch_later,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          // white card
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(70),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: appWhite,
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  padding:
                      EdgeInsets.only(top: 40, bottom: 40, right: 20, left: 20),
                  itemBuilder: (context, index) {
                    return CustomLessonCard(
                      lesson: lessonList[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 40);
                  },
                  itemCount: lessonList.length,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }
}
