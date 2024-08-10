import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ya9in/models/course.dart';
import 'package:ya9in/screens/review_screen.dart';
import 'package:ya9in/shared/colors.dart';
import 'package:ya9in/widgets/custom_button.dart';
import 'package:ya9in/widgets/custom_lesson_card.dart';
import 'package:ya9in/widgets/custom_tab_view.dart';

class EnrolledCourseDetailsScreen extends StatefulWidget {
  final Course course;
  const EnrolledCourseDetailsScreen({
    super.key,
    required this.course,
  });

  @override
  State<EnrolledCourseDetailsScreen> createState() =>
      _EnrolledCourseDetailsScreenState();
}

class _EnrolledCourseDetailsScreenState
    extends State<EnrolledCourseDetailsScreen> {
  int _selectedTag = 0;

  void changeTab(int index) {
    setState(() {
      _selectedTag = index;
    });
  }

  Widget getBody() {
    if (_selectedTag == 0) {
      return SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(bottom: 40, right: 20, left: 20, top: 20),
          child: Column(children: [
            ...List.generate(widget.course.lessons.length, (index) {
              return Column(
                children: [
                  CustomLessonCard(
                    lesson: widget.course.lessons[index],
                    course: widget.course,
                    isEnrolled: true,
                  ),
                  const SizedBox(height: 20),
                ],
              );
            }),
          ]),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          widget.course.description,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: appSecondary,
        title: Text(
          widget.course.title,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: appWhite),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: appWhite),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Column(
            children: [
              CustomTabView(
                changeTab: changeTab,
                index: _selectedTag,
                isEnrolled: true,
              ),
            ],
          ),
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
                  // Rate the course
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: CustomButtonBox(
                      color: appPrimary,
                      title: 'Rate this course',
                      isDisabled: false,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReviewScreen(
                                course: widget.course,
                              ),
                            ));
                      },
                      icon: Icons.star,
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
