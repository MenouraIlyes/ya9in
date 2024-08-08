import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ya9in/models/course.dart';
import 'package:ya9in/providers/course_provider.dart';
import 'package:ya9in/screens/course_details_screen.dart';
import 'package:ya9in/shared/colors.dart';
import 'package:ya9in/widgets/custom_course_card.dart';
import 'package:ya9in/widgets/custom_heading.dart';

class SearchResultScreen extends StatefulWidget {
  final String searchQuery;
  final List<String> categories;
  final String? duration;

  const SearchResultScreen({
    super.key,
    required this.searchQuery,
    required this.categories,
    this.duration,
  });

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<CourseProvider>(context, listen: false).fetchCourses();
    });
  }

  Widget getBody() {
    final courseProvider = Provider.of<CourseProvider>(context);
    final courses = courseProvider.courses;

    // Filter the courses based on the search query and filters
    final filteredCourses = courses.where((course) {
      final matchesQuery =
          course.title.toLowerCase().contains(widget.searchQuery.toLowerCase());
      final matchesCategory = widget.categories.isEmpty ||
          widget.categories.contains(course.category.title);
      final matchesDuration = widget.duration == null ||
          course.videoAmount.contains(widget.duration!);

      return matchesQuery && matchesCategory && matchesDuration;
    }).toList();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),

            // Display filtered results
            ShowFilteredCourses(filteredCourses),
          ],
        ),
      ),
    );
  }

  Widget ShowFilteredCourses(List<Course> Courses) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 30),
        child: Column(
          children: [
            ...List.generate(
              Courses.length,
              (index) {
                final course = Courses[index];
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(
        backgroundColor: appSecondary,
        centerTitle: true,
        title: Text(
          'Search Results',
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
      body: getBody(),
    );
  }
}
