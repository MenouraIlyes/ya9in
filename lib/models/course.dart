import 'package:ya9in/models/lesson.dart';

class Course {
  final String image;
  final String video;
  final String title;
  final String userProfile;
  final String userName;
  final String price;
  final double percentage;
  final List<Lesson> lessons;

  Course({
    required this.image,
    required this.video,
    required this.title,
    required this.userProfile,
    required this.userName,
    required this.price,
    required this.percentage,
    required this.lessons,
  });

  factory Course.fromMap(Map<String, dynamic> map) {
    var lessonsFromMap = map['lessons'] as List;
    List<Lesson> lessonList =
        lessonsFromMap.map((lessonMap) => Lesson.fromMap(lessonMap)).toList();

    return Course(
      image: map['image'],
      video: map['video'],
      title: map['title'],
      userProfile: map['user_profile'],
      userName: map['user_name'],
      price: map['price'],
      percentage: map['percentage'],
      lessons: lessonList,
    );
  }

  Map<String, dynamic> toMap() {
    List<Map<String, dynamic>> lessonsToMap =
        lessons.map((lesson) => lesson.toMap()).toList();

    return {
      'image': image,
      'video': video,
      'title': title,
      'user_profile': userProfile,
      'user_name': userName,
      'price': price,
      'percentage': percentage,
      'lessons': lessonsToMap,
    };
  }
}
