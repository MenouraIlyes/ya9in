import 'dart:ui';

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
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade300, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          // lesson play button
          lesson.isCompleted
              ? Image.asset(
                  'assets/play.png',
                  height: 30,
                )
              : Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'assets/not_play.png',
                    height: 30,
                  ),
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
                  height: 30,
                )
              : Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'assets/lock.png',
                    height: 30,
                  ),
                ),
        ],
      ),
    );
  }
}
