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

List<Lesson> lessonList = [
  Lesson(
    title: 'Introduction to React',
    videoUrl: 'https://example.com/video1.mp4',
    duration: 10,
    description: 'An introductory lesson on React.',
    isCompleted: true,
  ),
  Lesson(
    title: 'Firebase Basics',
    videoUrl: 'https://example.com/video2.mp4',
    duration: 15,
    description: 'A basic introduction to Firebase.',
    isCompleted: false,
  ),
  Lesson(
    title: 'State Management in React',
    videoUrl: 'https://example.com/video3.mp4',
    duration: 20,
    description: 'Understanding state management in React.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Firestore Integration',
    videoUrl: 'https://example.com/video4.mp4',
    duration: 25,
    description: 'Integrating Firestore with React.',
    isCompleted: false,
  ),
  Lesson(
    title: 'User Authentication',
    videoUrl: 'https://example.com/video5.mp4',
    duration: 30,
    description: 'Implementing user authentication with Firebase.',
    isCompleted: false,
  ),
  Lesson(
    title: 'React Router Basics',
    videoUrl: 'https://example.com/video6.mp4',
    duration: 18,
    description: 'Navigating between pages using React Router.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Building Reusable Components',
    videoUrl: 'https://example.com/video7.mp4',
    duration: 22,
    description: 'Creating reusable components in React.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Advanced Firebase Functions',
    videoUrl: 'https://example.com/video8.mp4',
    duration: 35,
    description: 'Exploring advanced functions in Firebase.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Performance Optimization',
    videoUrl: 'https://example.com/video9.mp4',
    duration: 28,
    description: 'Optimizing performance in React applications.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Deployment and Hosting',
    videoUrl: 'https://example.com/video10.mp4',
    duration: 40,
    description: 'Deploying and hosting React applications.',
    isCompleted: false,
  ),
];
