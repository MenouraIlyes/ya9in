import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ya9in/models/course.dart';
import 'package:ya9in/providers/course_provider.dart';
import 'package:ya9in/screens/enrolled_course_details_screen.dart';
import 'package:ya9in/shared/colors.dart';
import 'package:ya9in/widgets/custom_heading.dart';
import 'package:ya9in/widgets/custom_my_courses_card.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  Widget getBody(List<Course> courses) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomHeading(
                  title: "My Courses",
                  color: Colors.black,
                  subTitle: "Let's continue, shall we?",
                ),

                // Number of courses enrolled in
                Text(
                  "${enrolledCourses.length} Courses",
                  style: TextStyle(
                    fontSize: 17,
                    color: appBackground,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            // Courses cards
            SizedBox(height: 50),
            Column(
              children: List.generate(
                enrolledCourses.length,
                (index) {
                  final course = enrolledCourses[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EnrolledCourseDetailsScreen(course: course),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: CustomMyCoursesCard(
                        image: course.image,
                        instructor: course.UploadedBy,
                        title: course.title,
                        videoAmount: course.videoAmount,
                        percentage: course.percentage,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<CourseProvider>(
        builder: (context, courseProvider, child) {
          final courses = courseProvider.courses;
          return getBody(courses);
        },
      ),
    );
  }
}
