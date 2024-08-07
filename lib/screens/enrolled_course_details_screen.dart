import 'package:flutter/material.dart';
import 'package:ya9in/models/course.dart';
import 'package:ya9in/models/lesson.dart';
import 'package:ya9in/shared/colors.dart';
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
          padding: const EdgeInsets.only(bottom: 40, right: 20, left: 20),
          child: Column(children: [
            ...List.generate(widget.course.lessons.length, (index) {
              return Column(
                children: [
                  CustomLessonCard(
                    lesson: widget.course.lessons[index],
                    course: widget.course,
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
        backgroundColor: appWhite,
        title: Text(
          widget.course.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: appBackground),
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
              ),
            ],
          ),
        ),
      ),
      body: getBody(),
    );
  }
}
