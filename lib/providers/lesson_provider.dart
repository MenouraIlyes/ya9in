import 'package:flutter/material.dart';
import 'package:ya9in/models/lesson.dart';

class LessonProvider with ChangeNotifier {
  List<Lesson> _lessons = [];

  List<Lesson> get lessons => _lessons;

  void setLessons(List<Lesson> lessons) {
    _lessons = lessons;
    notifyListeners();
  }

  void addLesson(Lesson lesson) {
    _lessons.add(lesson);
    notifyListeners();
  }

  void removeLesson(Lesson lesson) {
    _lessons.remove(lesson);
    notifyListeners();
  }

  void updateLesson(Lesson updatedLesson) {
    final index =
        _lessons.indexWhere((lesson) => lesson.title == updatedLesson.title);
    if (index != -1) {
      _lessons[index] = updatedLesson;
      notifyListeners();
    }
  }
}
