import 'package:flutter/material.dart';
import 'package:ya9in/models/course.dart';
import 'package:ya9in/models/lesson.dart';
import 'package:ya9in/shared/colors.dart';
import 'package:ya9in/widgets/custom_lesson_card.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerScreen extends StatefulWidget {
  final String videoId;
  final Lesson lesson;
  final Course course;

  YoutubePlayerScreen({
    required this.videoId,
    required this.lesson,
    required this.course,
  });

  @override
  _YoutubePlayerScreenState createState() => _YoutubePlayerScreenState();
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.red,
        onReady: () {
          print('Player is ready.');
        },
        onEnded: (YoutubeMetaData metaData) {
          _controller.pause();
        },
      ),
      builder: (context, player) {
        return Scaffold(
          backgroundColor: appWhite,
          appBar: AppBar(
            backgroundColor: appWhite,
            title: Text(
              widget.lesson.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: appBackground),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Column(
            children: [
              // Player
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: appWhite,
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: player,
                  ),
                ),
              ),

              // Other Videos
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Text(
                  'All Lessons (${widget.course.lessons.length})',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),

              // Other lessons
              SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 40, right: 20, left: 20),
                  child: Column(
                    children: [
                      ...List.generate(widget.course.lessons.length, (index) {
                        return Column(
                          children: [
                            CustomLessonCard(
                              lesson: widget.course.lessons[index],
                              course: widget.course,
                              isEnrolled: true,
                            ),
                            const SizedBox(height: 20),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
