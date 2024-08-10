import 'package:flutter/material.dart';
import 'package:ya9in/models/category.dart';
import 'package:ya9in/models/course.dart';
import 'package:ya9in/models/lesson.dart';

class CourseProvider with ChangeNotifier {
  List<Course> _courses = Courses; // example courses from the model

  List<Course> get courses => _courses;

  Future<void> fetchCourses() async {
    // Simulate fetching data (e.g., from a remote source)
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay

    // Optionally: Fetch data from a remote source or local database
    // In this case, we're just using the already set courses
    _courses = Courses; // or you might load from a local file or API
    notifyListeners();
  }

  void setCourses(List<Course> courses) {
    _courses = courses;
    notifyListeners();
  }

  void addCourse(Course course) {
    _courses.add(course);
    notifyListeners();
  }

  void removeCourse(Course course) {
    _courses.remove(course);
    notifyListeners();
  }

  void updateCourse(Course updatedCourse) {
    final index =
        _courses.indexWhere((course) => course.title == updatedCourse.title);
    if (index != -1) {
      _courses[index] = updatedCourse;
      notifyListeners();
    }
  }

  Course? getCourseByTitle(String title) {
    return _courses.firstWhere(
      (course) => course.title == title,
      orElse: () => Course(
        image: 'default_image.png',
        videoAmount: 'default_video.mp4',
        title: 'Default Course',
        userProfilePicture: 'default_user_profile.png',
        UploadedBy: 'Default User',
        price: 'Free',
        description: '',
        percentage: 0.0,
        lessons: [],
        ratings: [],
        averageRating: 0.0,
        category: Category(icon: Icons.error, title: ''),
      ),
    );
  }

  void addLessonToCourse(String courseTitle, Lesson lesson) {
    final course = getCourseByTitle(courseTitle);
    if (course != null) {
      course.lessons.add(lesson);
      notifyListeners();
    }
  }

  void removeLessonFromCourse(String courseTitle, Lesson lesson) {
    final course = getCourseByTitle(courseTitle);
    if (course != null) {
      course.lessons.remove(lesson);
      notifyListeners();
    }
  }
}
