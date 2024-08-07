import 'package:ya9in/models/lesson.dart';
import 'package:ya9in/models/rating.dart';
import 'package:ya9in/models/category.dart';

class Course {
  final String image;
  final String videoAmount;
  final String title;
  final int totalDuration;
  final String userProfilePicture;
  final String UploadedBy;
  final String price;
  final double percentage;
  final String description;
  final List<Lesson> lessons;
  final List<Rating> ratings;
  final double averageRating;
  final Category category;

  Course({
    required this.image,
    required this.videoAmount,
    required this.title,
    required this.userProfilePicture,
    required this.UploadedBy,
    required this.price,
    required this.percentage,
    required this.description,
    required this.lessons,
    required this.ratings,
    required this.averageRating,
    required this.category,
  }) : totalDuration = lessons.fold(0, (sum, lesson) => sum + lesson.duration);

  factory Course.fromMap(Map<String, dynamic> map) {
    var lessonsFromMap = map['lessons'] as List;
    List<Lesson> lessonList =
        lessonsFromMap.map((lessonMap) => Lesson.fromMap(lessonMap)).toList();

    var ratingsFromMap = map['ratings'] as List;
    List<Rating> ratingList =
        ratingsFromMap.map((ratingMap) => Rating.fromMap(ratingMap)).toList();

    return Course(
      image: map['image'],
      videoAmount: map['video'],
      title: map['title'],
      userProfilePicture: map['user_profile_picture'],
      UploadedBy: map['uploaded_by'],
      price: map['price'],
      percentage: map['percentage'],
      description: map['description'],
      lessons: lessonList,
      ratings: ratingList,
      averageRating: map['average_rating'],
      category: Category.fromMap(map['category']),
    );
  }

  Map<String, dynamic> toMap() {
    List<Map<String, dynamic>> lessonsToMap =
        lessons.map((lesson) => lesson.toMap()).toList();

    List<Map<String, dynamic>> ratingsToMap =
        ratings.map((rating) => rating.toMap()).toList();

    return {
      'image': image,
      'video': videoAmount,
      'title': title,
      'user_profile_picture': userProfilePicture,
      'uploaded_by': UploadedBy,
      'price': price,
      'percentage': percentage,
      'description': description,
      'lessons': lessonsToMap,
      'ratings': ratingsToMap,
      'average_rating': averageRating,
      'category': category.toMap(),
      'totalDuration': totalDuration,
    };
  }
}

List<Course> Courses = [
  Course(
    image: 'assets/flutterIntro.png',
    videoAmount: '4',
    title: 'Introduction to Flutter',
    userProfilePicture: 'assets/user1.jpg',
    UploadedBy: 'John Doe',
    price: '5000',
    percentage: 0.0,
    description:
        "This course is designed for beginners who want to dive into the world of Flutter. You will learn the fundamentals of Flutter, including setting up your environment, creating basic widgets, and understanding the core concepts of Flutter development. By the end of this course, you'll be able to build simple Flutter applications.",
    lessons: flutterLessons,
    ratings: [],
    averageRating: 0.0,
    category: allCategories[3],
  ),
  Course(
    image: 'assets/dart.jpg',
    videoAmount: '3',
    title: 'Advanced Dart Programming',
    userProfilePicture: 'assets/user2.jpg',
    UploadedBy: 'Jane Smith',
    price: '49.99',
    percentage: 0.0,
    description:
        "This course is aimed at developers who already have a basic understanding of Dart and want to take their skills to the next level. You will delve deeper into advanced topics such as asynchronous programming, Dart streams, and functional programming with Dart. By the end of this course, you will have a strong grasp of advanced Dart concepts and be able to apply them in your Flutter projects.",
    lessons: dartLessons,
    ratings: [],
    averageRating: 0.0,
    category: allCategories[3],
  ),
  Course(
    image: 'assets/stateFlutter.jpg',
    videoAmount: '5',
    title: 'State Management in Flutter',
    userProfilePicture: 'assets/user3.jpg',
    UploadedBy: 'Alice Johnson',
    price: '29.99',
    percentage: 0.0,
    description:
        "This course focuses on one of the most crucial aspects of Flutter development: state management. You will explore various state management techniques, including Provider, Riverpod, Bloc, and more. This course is ideal for developers who want to build scalable and maintainable Flutter applications. By the end of this course, you will be proficient in managing state in Flutter applications.",
    lessons: stateManagementLessons,
    ratings: [],
    averageRating: 0.0,
    category: allCategories[3],
  ),
];
