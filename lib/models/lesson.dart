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
    title: 'Setting Up Your Flutter Environment',
    videoUrl: 'https://example.com/videos/flutter_setup.mp4',
    duration: 15,
    description: 'Learn how to set up your Flutter development environment.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Creating Your First Flutter App',
    videoUrl: 'https://example.com/videos/flutter_first_app.mp4',
    duration: 10,
    description: 'Build your first Flutter app with basic widgets.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Understanding Flutter Widgets',
    videoUrl: 'https://example.com/videos/flutter_widgets.mp4',
    duration: 5,
    description: 'Dive into the world of Flutter widgets and how to use them.',
    isCompleted: false,
  ),
  Lesson(
    title: 'State Management Basics',
    videoUrl: 'https://example.com/videos/flutter_state_management.mp4',
    duration: 20,
    description: 'Learn the basics of state management in Flutter.',
    isCompleted: false,
  ),
];

List<Lesson> dartLessons = [
  Lesson(
    title: 'Asynchronous Programming',
    videoUrl: 'https://www.youtube.com/watch?v=1xipg02Wu8s',
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

List<Lesson> pythonDataLessons = [
  Lesson(
    title: 'Introduction to Pandas',
    videoUrl: 'https://www.youtube.com/watch?v=IShjRUzJtbw',
    duration: 18,
    description: 'Learn the basics of data manipulation with pandas.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Data Cleaning and Preparation',
    videoUrl: 'https://www.youtube.com/watch?v=bDhvCp3_lYw',
    duration: 20,
    description: 'Techniques for cleaning and preparing data for analysis.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Data Visualization with Matplotlib',
    videoUrl: 'https://www.youtube.com/watch?v=OZOOLe2imFo',
    duration: 22,
    description: 'Visualize data using the Matplotlib library.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Exploratory Data Analysis',
    videoUrl: 'https://www.youtube.com/watch?v=QiqZliDXCCg',
    duration: 25,
    description: 'Perform exploratory data analysis to uncover insights.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Advanced Data Analysis Techniques',
    videoUrl: 'https://www.youtube.com/watch?v=xi0vhXFPegw',
    duration: 30,
    description: 'Learn advanced techniques for data analysis in Python.',
    isCompleted: false,
  ),
];

List<Lesson> machineLearningLessons = [
  Lesson(
    title: 'Introduction to Machine Learning',
    videoUrl: 'https://example.com/videos/ml_intro.mp4',
    duration: 14,
    description: 'Get an overview of machine learning and its applications.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Supervised Learning Techniques',
    videoUrl: 'https://example.com/videos/ml_supervised.mp4',
    duration: 26,
    description:
        'Explore supervised learning algorithms like linear regression and decision trees.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Unsupervised Learning Techniques',
    videoUrl: 'https://example.com/videos/ml_unsupervised.mp4',
    duration: 23,
    description:
        'Understand unsupervised learning algorithms like clustering and PCA.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Neural Networks and Deep Learning',
    videoUrl: 'https://example.com/videos/ml_neural_networks.mp4',
    duration: 35,
    description: 'Dive into the world of neural networks and deep learning.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Support Vector Machines',
    videoUrl: 'https://example.com/videos/ml_svm.mp4',
    duration: 28,
    description:
        'Learn about support vector machines and how they are used in machine learning.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Model Evaluation and Tuning',
    videoUrl: 'https://example.com/videos/ml_model_evaluation.mp4',
    duration: 32,
    description:
        'Evaluate and tune your machine learning models for better performance.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Real-World Machine Learning Projects',
    videoUrl: 'https://example.com/videos/ml_projects.mp4',
    duration: 40,
    description:
        'Apply your machine learning knowledge to real-world projects.',
    isCompleted: false,
  ),
];

List<Lesson> webDesignLessons = [
  Lesson(
    title: 'Introduction to HTML',
    videoUrl: 'https://www.youtube.com/watch?v=qz0aGYrrlhU',
    duration: 12,
    description: 'Learn the basics of HTML and how to structure a web page.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Styling with CSS',
    videoUrl: 'https://www.youtube.com/watch?v=wRNinF7YQqQ',
    duration: 18,
    description: 'Learn how to style your web pages using CSS.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Responsive Design Basics',
    videoUrl: 'https://www.youtube.com/watch?v=x4u1yp3Msao',
    duration: 20,
    description:
        'Learn how to make your web pages responsive for different devices.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Introduction to JavaScript',
    videoUrl: 'https://www.youtube.com/watch?v=lkIFF4maKMU',
    duration: 22,
    description:
        'Get started with JavaScript for adding interactivity to your web pages.',
    isCompleted: false,
  ),
];

List<Lesson> financialAnalysisLessons = [
  Lesson(
    title: 'Understanding Financial Statements',
    videoUrl: 'https://example.com/videos/finance_statements.mp4',
    duration: 19,
    description: 'Learn how to read and interpret financial statements.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Ratio Analysis',
    videoUrl: 'https://example.com/videos/finance_ratio_analysis.mp4',
    duration: 21,
    description:
        'Analyze financial ratios to evaluate a company’s performance.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Financial Forecasting Techniques',
    videoUrl: 'https://example.com/videos/finance_forecasting.mp4',
    duration: 22,
    description: 'Learn techniques for forecasting financial performance.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Building Financial Models',
    videoUrl: 'https://example.com/videos/finance_models.mp4',
    duration: 30,
    description: 'Create financial models to predict future outcomes.',
    isCompleted: false,
  ),
];

List<Lesson> photographyLessons = [
  Lesson(
    title: 'Introduction to Photography',
    videoUrl: 'https://example.com/videos/photo_intro.mp4',
    duration: 12,
    description:
        'Learn the basics of photography, including composition and lighting.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Mastering Camera Settings',
    videoUrl: 'https://example.com/videos/photo_camera_settings.mp4',
    duration: 16,
    description: 'Understand your camera settings to take better photos.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Introduction to Video Editing',
    videoUrl: 'https://example.com/videos/video_editing_intro.mp4',
    duration: 20,
    description:
        'Learn the basics of video editing, including cutting and transitions.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Color Grading in Video Editing',
    videoUrl: 'https://example.com/videos/video_editing_color_grading.mp4',
    duration: 18,
    description:
        'Enhance your videos with professional color grading techniques.',
    isCompleted: false,
  ),
];

List<Lesson> digitalMarketingLessons = [
  Lesson(
    title: 'Introduction to Digital Marketing',
    videoUrl: 'https://example.com/videos/dm_intro.mp4',
    duration: 14,
    description:
        'Get an overview of digital marketing strategies and channels.',
    isCompleted: false,
  ),
  Lesson(
    title: 'SEO Basics',
    videoUrl: 'https://example.com/videos/dm_seo.mp4',
    duration: 22,
    description:
        'Learn the basics of search engine optimization (SEO) and how to improve website rankings.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Social Media Marketing',
    videoUrl: 'https://example.com/videos/dm_social_media.mp4',
    duration: 20,
    description:
        'Understand how to market effectively on social media platforms.',
    isCompleted: false,
  ),
  Lesson(
    title: 'Email Marketing Strategies',
    videoUrl: 'https://example.com/videos/dm_email_marketing.mp4',
    duration: 18,
    description:
        'Learn strategies for creating effective email marketing campaigns.',
    isCompleted: false,
  ),
];

List<Lesson> javascriptLessons = [
  Lesson(
    title: 'JavaScript Basics',
    videoUrl: 'https://example.com/videos/js_basics.mp4',
    duration: 15,
    description:
        'Learn the fundamentals of JavaScript, including variables and data types.',
    isCompleted: false,
  ),
  Lesson(
    title: 'JavaScript DOM Manipulation',
    videoUrl: 'https://example.com/videos/js_dom.mp4',
    duration: 20,
    description: 'Learn how to manipulate the DOM using JavaScript.',
    isCompleted: false,
  ),
  Lesson(
    title: 'JavaScript Events',
    videoUrl: 'https://example.com/videos/js_events.mp4',
    duration: 18,
    description: 'Understand how to handle events in JavaScript.',
    isCompleted: false,
  ),
  Lesson(
    title: 'JavaScript ES6 Features',
    videoUrl: 'https://example.com/videos/js_es6.mp4',
    duration: 22,
    description:
        'Explore the new features introduced in ES6, including arrow functions and promises.',
    isCompleted: false,
  ),
];
