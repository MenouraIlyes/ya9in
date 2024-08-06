class Lesson {
  final String title;
  final String videoUrl;
  final int duration;
  final String description;
  bool isCompleted;

  Lesson({
    required this.title,
    required this.videoUrl,
    required this.duration,
    required this.description,
    this.isCompleted = false,
  });

  factory Lesson.fromMap(Map<String, dynamic> map) {
    return Lesson(
      title: map['title'],
      videoUrl: map['videoUrl'],
      duration: map['duration'],
      description: map['description'],
      isCompleted: map['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'videoUrl': videoUrl,
      'duration': duration,
      'description': description,
      'isCompleted': isCompleted,
    };
  }
}

List<Lesson> flutterLessons = [
  Lesson(
    title: 'Setting up Flutter',
    videoUrl: 'https://www.youtube.com/watch?v=VPvVD8t02U8',
    duration: 10,
    description:
        'Learn how to set up Flutter on your machine and create your first project.',
  ),
  Lesson(
    title: 'Hello World',
    videoUrl:
        'https://www.youtube.com/watch?v=RAL2RW3sSY4&list=PL6yRaaP0WPkVtoeNIGqILtRAgd3h2CNpT&index=3',
    duration: 15,
    description:
        'Create your first Flutter app with a simple Hello World example.',
  ),
  Lesson(
    title: 'Flutter Widgets',
    videoUrl:
        'https://www.youtube.com/watch?v=niAmg31m0aE&list=PL6yRaaP0WPkVtoeNIGqILtRAgd3h2CNpT&index=4',
    duration: 20,
    description: 'An overview of the most commonly used widgets in Flutter.',
  ),
];

List<Lesson> dartLessons = [
  Lesson(
    title: 'Asynchronous Programming',
    videoUrl: 'assets/videos/dart1.mp4',
    duration: 30,
    description: 'Learn about Futures, async, and await in Dart.',
  ),
  Lesson(
    title: 'Streams',
    videoUrl: 'assets/videos/dart2.mp4',
    duration: 25,
    description: 'Understand how to work with streams in Dart.',
  ),
  Lesson(
    title: 'Isolates',
    videoUrl: 'assets/videos/dart3.mp4',
    duration: 35,
    description:
        'Learn about isolates and how to use them for concurrent programming in Dart.',
  ),
];

List<Lesson> stateManagementLessons = [
  Lesson(
    title: 'Provider Package',
    videoUrl: 'assets/videos/state1.mp4',
    duration: 20,
    description:
        'Introduction to state management using the Provider package in Flutter.',
  ),
  Lesson(
    title: 'Bloc Pattern',
    videoUrl: 'assets/videos/state2.mp4',
    duration: 25,
    description:
        'Learn about the Bloc pattern and how to use it in Flutter applications.',
  ),
  Lesson(
    title: 'Riverpod',
    videoUrl: 'assets/videos/state3.mp4',
    duration: 30,
    description:
        'An overview of Riverpod, a provider-like state management solution.',
  ),
];
