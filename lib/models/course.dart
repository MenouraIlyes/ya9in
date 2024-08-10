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
    image:
        'https://unsplash.com/photos/a-male-programer-working-with-laptop-and-coding-on-computer-oYKVcuxlV10',
    videoAmount: '4',
    title: 'Introduction to Flutter',
    userProfilePicture:
        'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e',
    UploadedBy: 'John Doe',
    price: '5000',
    percentage: 0.0,
    description:
        "This course is designed for beginners who want to dive into the world of Flutter. You will learn the fundamentals of Flutter, including setting up your environment, creating basic widgets, and understanding the core concepts of Flutter development. By the end of this course, you'll be able to build simple Flutter applications.",
    lessons: flutterLessons,
    ratings: [],
    averageRating: 0.0,
    category: allCategories[3], // Development
  ),
  Course(
    image:
        'https://unsplash.com/photos/black-and-silver-laptop-computer-FJ5e_2f96h4',
    videoAmount: '3',
    title: 'Advanced Dart Programming',
    userProfilePicture:
        'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df',
    UploadedBy: 'Jane Smith',
    price: '49.99',
    percentage: 0.0,
    description:
        "This course is aimed at developers who already have a basic understanding of Dart and want to take their skills to the next level. You will delve deeper into advanced topics such as asynchronous programming, Dart streams, and functional programming with Dart. By the end of this course, you will have a strong grasp of advanced Dart concepts and be able to apply them in your Flutter projects.",
    lessons: dartLessons,
    ratings: [],
    averageRating: 0.0,
    category: allCategories[3], // Development
  ),
  Course(
    image:
        'https://unsplash.com/photos/a-macbook-with-lines-of-code-on-its-screen-on-a-busy-desk-m_HRfLhgABo',
    videoAmount: '5',
    title: 'State Management in Flutter',
    userProfilePicture:
        'https://images.unsplash.com/photo-1485217988980-11786ced9454',
    UploadedBy: 'Alice Johnson',
    price: '29.99',
    percentage: 0.0,
    description:
        "This course focuses on one of the most crucial aspects of Flutter development: state management. You will explore various state management techniques, including Provider, Riverpod, Bloc, and more. This course is ideal for developers who want to build scalable and maintainable Flutter applications. By the end of this course, you will be proficient in managing state in Flutter applications.",
    lessons: stateManagementLessons,
    ratings: [],
    averageRating: 0.0,
    category: allCategories[3], // Development
  ),
  Course(
    image: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8',
    videoAmount: '6',
    title: 'Data Analysis with Python',
    userProfilePicture:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
    UploadedBy: 'Michael Lee',
    price: '59.99',
    percentage: 0.0,
    description:
        "Master data analysis with Python! This course covers everything from data manipulation with pandas to data visualization with matplotlib and seaborn. Ideal for data enthusiasts and professionals aiming to enhance their analytical skills.",
    lessons: pythonDataLessons,
    ratings: [],
    averageRating: 0.0,
    category: allCategories[5], // IT & Software
  ),
  Course(
    image: 'https://images.unsplash.com/photo-1556740749-887f6717d7e4',
    videoAmount: '8',
    title: 'Machine Learning A-Z',
    userProfilePicture:
        'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61',
    UploadedBy: 'Emily Davis',
    price: '99.99',
    percentage: 0.0,
    description:
        "Dive into the world of machine learning! This comprehensive course will guide you through the basics to advanced topics like neural networks, decision trees, and support vector machines. Suitable for beginners and professionals.",
    lessons: machineLearningLessons,
    ratings: [],
    averageRating: 0.0,
    category: allCategories[5], // IT & Software
  ),
  Course(
    image: 'https://images.unsplash.com/photo-1518241353330-e7ec58b7e968',
    videoAmount: '4',
    title: 'Web Design for Beginners',
    userProfilePicture:
        'https://images.unsplash.com/photo-1511367461989-f85a21fda167',
    UploadedBy: 'Laura White',
    price: '39.99',
    percentage: 0.0,
    description:
        "Learn the fundamentals of web design, including HTML, CSS, and responsive design. Perfect for beginners looking to create their first website.",
    lessons: webDesignLessons,
    ratings: [],
    averageRating: 0.0,
    category: allCategories[2], // Design
  ),
  Course(
    image: 'https://images.unsplash.com/photo-1599834562820-2a008346fe04',
    videoAmount: '7',
    title: 'Financial Analysis and Forecasting',
    userProfilePicture:
        'https://images.unsplash.com/photo-1595152772835-219674b2a8a6',
    UploadedBy: 'Robert Brown',
    price: '79.99',
    percentage: 0.0,
    description:
        "This course covers financial analysis techniques, including ratio analysis, forecasting, and financial modeling. Ideal for finance professionals and business owners.",
    lessons: financialAnalysisLessons,
    ratings: [],
    averageRating: 0.0,
    category: allCategories[1], // Finance & Accounting
  ),
  Course(
    image: 'https://images.unsplash.com/photo-1504198453319-5ce911bafcde',
    videoAmount: '5',
    title: 'Photography Basics: Capture Stunning Photos',
    userProfilePicture:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
    UploadedBy: 'Chris Green',
    price: '24.99',
    percentage: 0.0,
    description:
        "Learn the basics of photography, from composition to lighting and editing. Perfect for beginners who want to take their photography skills to the next level.",
    lessons: photographyLessons,
    ratings: [],
    averageRating: 0.0,
    category: allCategories[6], // Photography & Video
  ),
  Course(
    image: 'https://images.unsplash.com/photo-1504384308090-c894fdcc538d',
    videoAmount: '6',
    title: 'Social Media Marketing Mastery',
    userProfilePicture:
        'https://images.unsplash.com/photo-1517841905240-472988babdf9',
    UploadedBy: 'Sophia King',
    price: '49.99',
    percentage: 0.0,
    description:
        "Master the art of social media marketing! Learn how to create effective campaigns, grow your audience, and boost your brand's presence across platforms like Facebook, Instagram, and Twitter.",
    lessons: digitalMarketingLessons,
    ratings: [],
    averageRating: 0.0,
    category: allCategories[7], // Marketing
  ),
  Course(
    image: 'https://images.unsplash.com/photo-1560264418-44e94d7afc2f',
    videoAmount: '4',
    title: 'Javascript : be a pro in hours',
    userProfilePicture:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
    UploadedBy: 'Daniel Wilson',
    price: '34.99',
    percentage: 0.0,
    description:
        "Discover the art of javascript! This course will guide you through techniques for coding,  development, and building compelling apps.",
    lessons: javascriptLessons,
    ratings: [],
    averageRating: 0.0,
    category: allCategories[11], // Personal Development
  ),
];

List<Course> featuredCourses = [
  Course(
    image: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8',
    videoAmount: '6',
    title: 'Data Analysis with Python',
    userProfilePicture:
        'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
    UploadedBy: 'Michael Lee',
    price: '59.99',
    percentage: 0.0,
    description:
        "Master data analysis with Python! This course covers everything from data manipulation with pandas to data visualization with matplotlib and seaborn. Ideal for data enthusiasts and professionals aiming to enhance their analytical skills.",
    lessons: pythonDataLessons,
    ratings: [],
    averageRating: 0.0,
    category: allCategories[5], // IT & Software
  ),
  Course(
    image: 'https://images.unsplash.com/photo-1556740749-887f6717d7e4',
    videoAmount: '8',
    title: 'Machine Learning A-Z',
    userProfilePicture:
        'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61',
    UploadedBy: 'Emily Davis',
    price: '99.99',
    percentage: 0.0,
    description:
        "Dive into the world of machine learning! This comprehensive course will guide you through the basics to advanced topics like neural networks, decision trees, and support vector machines. Suitable for beginners and professionals.",
    lessons: machineLearningLessons,
    ratings: [],
    averageRating: 0.0,
    category: allCategories[5], // IT & Software
  ),
  Course(
    image: 'https://images.unsplash.com/photo-1518241353330-e7ec58b7e968',
    videoAmount: '4',
    title: 'Web Design for Beginners',
    userProfilePicture:
        'https://images.unsplash.com/photo-1511367461989-f85a21fda167',
    UploadedBy: 'Laura White',
    price: '39.99',
    percentage: 0.0,
    description:
        "Learn the fundamentals of web design, including HTML, CSS, and responsive design. Perfect for beginners looking to create their first website.",
    lessons: webDesignLessons,
    ratings: [],
    averageRating: 0.0,
    category: allCategories[2], // Design
  ),
  Course(
    image: 'https://images.unsplash.com/photo-1599834562820-2a008346fe04',
    videoAmount: '7',
    title: 'Financial Analysis and Forecasting',
    userProfilePicture:
        'https://images.unsplash.com/photo-1595152772835-219674b2a8a6',
    UploadedBy: 'Robert Brown',
    price: '79.99',
    percentage: 0.0,
    description:
        "This course covers financial analysis techniques, including ratio analysis, forecasting, and financial modeling. Ideal for finance professionals and business owners.",
    lessons: financialAnalysisLessons,
    ratings: [],
    averageRating: 0.0,
    category: allCategories[1], // Finance & Accounting
  ),
  Course(
    image: 'https://images.unsplash.com/photo-1504198453319-5ce911bafcde',
    videoAmount: '5',
    title: 'Photography Basics: Capture Stunning Photos',
    userProfilePicture:
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
    UploadedBy: 'Chris Green',
    price: '24.99',
    percentage: 0.0,
    description:
        "Learn the basics of photography, from composition to lighting and editing. Perfect for beginners who want to take their photography skills to the next level.",
    lessons: photographyLessons,
    ratings: [],
    averageRating: 0.0,
    category: allCategories[6], // Photography & Video
  ),
];

List<Course> enrolledCourses = [
  Course(
    image: 'https://images.unsplash.com/photo-1518241353330-e7ec58b7e968',
    videoAmount: '4',
    title: 'Web Design for Beginners',
    userProfilePicture:
        'https://images.unsplash.com/photo-1511367461989-f85a21fda167',
    UploadedBy: 'Laura White',
    price: '39.99',
    percentage: 70.0,
    description:
        "Learn the fundamentals of web design, including HTML, CSS, and responsive design. Perfect for beginners looking to create their first website.",
    lessons: webDesignLessons,
    ratings: [],
    averageRating: 0.0,
    category: allCategories[2], // Design
  ),
  Course(
    image: 'https://images.unsplash.com/photo-1599834562820-2a008346fe04',
    videoAmount: '7',
    title: 'Financial Analysis and Forecasting',
    userProfilePicture:
        'https://images.unsplash.com/photo-1595152772835-219674b2a8a6',
    UploadedBy: 'Robert Brown',
    price: '79.99',
    percentage: 30.0,
    description:
        "This course covers financial analysis techniques, including ratio analysis, forecasting, and financial modeling. Ideal for finance professionals and business owners.",
    lessons: financialAnalysisLessons,
    ratings: [],
    averageRating: 0.0,
    category: allCategories[1], // Finance & Accounting
  ),
];
