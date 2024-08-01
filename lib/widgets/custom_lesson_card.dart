import 'package:flutter/material.dart';
import 'package:ya9in/models/lesson.dart';

class CustomLessonCard extends StatelessWidget {
  final Lesson lesson;
  const CustomLessonCard({
    super.key,
    required this.lesson,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // lesson play button
        lesson.isCompleted
            ? Image.asset(
                'assets/play.png',
                height: 45,
              )
            : Image.asset(
                'assets/not_play.png',
                height: 45,
              ),

        SizedBox(width: 15),

        // lesson title and duration
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lesson.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${lesson.duration.toString()} min',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),

        // lesson completed ?
        lesson.isCompleted
            ? Image.asset(
                'assets/check.png',
                height: 40,
              )
            : Image.asset(
                'assets/lock.png',
                height: 40,
              ),
      ],
    );
  }
}
