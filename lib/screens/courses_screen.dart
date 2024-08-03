import 'package:flutter/material.dart';
import 'package:ya9in/datas/course_json.dart';
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
  Widget getBody() {
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
                  "${MyCoursesJson.length} Courses",
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EnrolledCourseDetailsScreen(),
                    ));
              },
              child: Column(
                children: List.generate(
                  MyCoursesJson.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: CustomMyCoursesCard(
                        image: MyCoursesJson[index]['image'],
                        instructor: MyCoursesJson[index]['user_name'],
                        title: MyCoursesJson[index]['title'],
                        videoAmount: MyCoursesJson[index]['video'],
                        percentage: MyCoursesJson[index]['percentage'],
                      ),
                    );
                  },
                ),
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: getBody(),
    );
  }
}
