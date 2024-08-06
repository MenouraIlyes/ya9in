import 'package:ya9in/models/lesson.dart';

class Course {
  final String image;
  final String videoAmount;
  final String title;
  final String userProfile;
  final String userName;
  final String price;
  final double percentage;
  final String description;
  final List<Lesson> lessons;

  Course({
    required this.image,
    required this.videoAmount,
    required this.title,
    required this.userProfile,
    required this.userName,
    required this.price,
    required this.percentage,
    required this.description,
    required this.lessons,
  });

  factory Course.fromMap(Map<String, dynamic> map) {
    var lessonsFromMap = map['lessons'] as List;
    List<Lesson> lessonList =
        lessonsFromMap.map((lessonMap) => Lesson.fromMap(lessonMap)).toList();

    return Course(
      image: map['image'],
      videoAmount: map['video'],
      title: map['title'],
      userProfile: map['user_profile'],
      userName: map['user_name'],
      price: map['price'],
      percentage: map['percentage'],
      description: map['description'],
      lessons: lessonList,
    );
  }

  Map<String, dynamic> toMap() {
    List<Map<String, dynamic>> lessonsToMap =
        lessons.map((lesson) => lesson.toMap()).toList();

    return {
      'image': image,
      'video': videoAmount,
      'title': title,
      'user_profile': userProfile,
      'user_name': userName,
      'price': price,
      'percentage': percentage,
      'description': description,
      'lessons': lessonsToMap,
    };
  }
}

List<Course> Courses = [
  Course(
    image: 'assets/flutterIntro.png',
    videoAmount: '4',
    title: 'Introduction to Flutter',
    userProfile: 'assets/user1.jpg',
    userName: 'John Doe',
    price: '5000',
    percentage: 0.0,
    description:
        "This course is designed for beginners who want to dive into the world of Flutter. You will learn the fundamentals of Flutter, including setting up your environment, creating basic widgets, and understanding the core concepts of Flutter development. By the end of this course, you'll be able to build simple Flutter applications.",
    lessons: flutterLessons,
  ),
  Course(
    image: 'assets/dart.jpg',
    videoAmount: '3',
    title: 'Advanced Dart Programming',
    userProfile: 'assets/user2.jpg',
    userName: 'Jane Smith',
    price: '49.99',
    percentage: 0.0,
    description:
        "This course is aimed at developers who already have a basic understanding of Dart and want to take their skills to the next level. You will delve deeper into advanced topics such as asynchronous programming, Dart streams, and functional programming with Dart. By the end of this course, you will have a strong grasp of advanced Dart concepts and be able to apply them in your Flutter projects.",
    lessons: dartLessons,
  ),
  Course(
    image: 'assets/stateFlutter.jpg',
    videoAmount: '5',
    title: 'State Management in Flutter',
    userProfile: 'assets/user3.jpg',
    userName: 'Alice Johnson',
    price: '29.99',
    percentage: 0.0,
    description:
        "This course focuses on one of the most crucial aspects of Flutter development: state management. You will explore various state management techniques, including Provider, Riverpod, Bloc, and more. This course is ideal for developers who want to build scalable and maintainable Flutter applications. By the end of this course, you will be proficient in managing state in Flutter applications.",
    lessons: stateManagementLessons,
  ),
];
