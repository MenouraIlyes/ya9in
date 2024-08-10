import 'package:flutter/material.dart';
import 'package:ya9in/models/category.dart';
import 'package:ya9in/models/course.dart';
import 'package:ya9in/screens/course_details_screen.dart';
import 'package:ya9in/shared/colors.dart';
import 'package:ya9in/widgets/custom_course_card.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    super.key,
    required this.courses,
    required this.category,
  });

  final List<Course> courses;
  final Category category;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Widget getBody(List<Course> courses) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: widget.courses.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),

                  // Courses
                  ...List.generate(
                    courses.length,
                    (index) {
                      final course = widget.courses[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CourseDetailsScreen(course: course),
                              ),
                            );
                          },
                          child: CustomCourseCardShrink(
                            thumbNail: course.image,
                            title: course.title,
                            userName: course.UploadedBy,
                            price: course.price,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )
            : Center(
                child: Text(
                  "No ${widget.category.title} Courses available at the moment",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final courses = widget.courses;
    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(
        backgroundColor: appSecondary,
        centerTitle: true,
        title: Text(
          '${widget.category.title} Courses',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: appWhite,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: appWhite),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: getBody(courses),
    );
  }
}
