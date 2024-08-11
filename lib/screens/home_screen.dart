import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ya9in/models/category.dart';
import 'package:ya9in/models/course.dart';
import 'package:ya9in/providers/course_provider.dart';
import 'package:ya9in/providers/user_provider.dart';
import 'package:ya9in/screens/category_screen.dart';
import 'package:ya9in/screens/course_details_screen.dart';
import 'package:ya9in/shared/colors.dart';
import 'package:ya9in/widgets/clipper.dart';
import 'package:ya9in/widgets/custom_categories_button.dart';
import 'package:ya9in/widgets/custom_category_card.dart';
import 'package:ya9in/widgets/custom_course_card.dart';
import 'package:ya9in/widgets/custom_promotion_card.dart';
import 'package:ya9in/widgets/custom_search_field.dart';
import 'package:ya9in/widgets/custom_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<void> _fetchUserFuture;
  late Future<void> _fetchCoursesFuture;

  @override
  void initState() {
    super.initState();
    _fetchUserFuture =
        Provider.of<UserProvider>(context, listen: false).fetchUser();

    _fetchCoursesFuture =
        Provider.of<CourseProvider>(context, listen: false).fetchCourses();
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(children: [
        // background
        Stack(
          alignment: Alignment.topCenter,
          children: [
            ClipPath(
              clipper: BottomClipper(),
              child: Container(
                width: size.width,
                height: 300,
                decoration: BoxDecoration(
                  color: appSecondary,
                ),
              ),
            ),

            // rest of the body
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                children: [
                  SizedBox(height: 74),
                  FutureBuilder<void>(
                      future: _fetchUserFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          final userProvider =
                              Provider.of<UserProvider>(context);
                          final user = userProvider.user;
                          if (user == null) {
                            return CircularProgressIndicator();
                          } else {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Welcome Text Username
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Hi, ${user.name}',
                                        style: TextStyle(
                                          color: appWhite,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(height: 10.0),
                                      Text(
                                        "Let's start learning",
                                        style: TextStyle(
                                          color: appWhite,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ]),

                                // Username profile picture
                                Container(
                                  height: 80,
                                  width: 80,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.asset('assets/pfp.jpg'),
                                  ),
                                ),
                              ],
                            );
                          }
                        }
                      }),

                  // search field
                  SizedBox(height: 50),
                  CustomSearchField(
                    hintField: "Try 'Web Design'",
                    backgroundColor: appWhite,
                  ),

                  // categories
                  SizedBox(height: 20),
                  CustomCategoryCard(),
                ],
              ),
            )
          ],
        ),

        // Promotion card
        SizedBox(height: 50),
        CustomPromotionCard(),

        // featured courses
        SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.only(right: 25, left: 25),
          child: CustomTitle(title: "Featured Courses"),
        ),

        // The Featurd Courses
        SizedBox(height: 30),
        Consumer<CourseProvider>(
          builder: (context, courseProvider, child) {
            return FutureBuilder<void>(
              future: _fetchCoursesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 25, top: 10, bottom: 30),
                      child: Row(
                        children: List.generate(
                          featuredCourses.length,
                          (index) {
                            final course = featuredCourses[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CourseDetailsScreen(course: course),
                                    ),
                                  );
                                },
                                child: CustomCourseCardExpand(
                                  thumbNail: course.image,
                                  videoAmount: course.videoAmount,
                                  title: course.title,
                                  userProfile: course.userProfilePicture,
                                  userName: course.UploadedBy,
                                  price: course.price,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }
              },
            );
          },
        ),

        // categories
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: CustomTitle(
            title: "Categories",
          ),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: List.generate(
                  TopCategories.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: GestureDetector(
                        onTap: () {
                          // Filterd courses based on the selected category
                          List<Course> filteredCourses =
                              Courses.where((course) {
                            return course.category.title ==
                                TopCategories[index].title;
                          }).toList();

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryScreen(
                                  courses: filteredCourses,
                                  category: TopCategories[index],
                                ),
                              ));
                        },
                        child: CustomCategoriesButton(
                          title: TopCategories[index].title,
                          color: appTeriatery,
                          icon: TopCategories[index].icon,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: List.generate(
                  BottomCategories.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: GestureDetector(
                        onTap: () {
                          List<Course> filteredCourses =
                              Courses.where((course) {
                            return course.category.title ==
                                BottomCategories[index].title;
                          }).toList();

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryScreen(
                                  courses: filteredCourses,
                                  category: BottomCategories[index],
                                ),
                              ));
                        },
                        child: CustomCategoriesButton(
                          title: BottomCategories[index].title,
                          color: appTeriatery,
                          icon: BottomCategories[index].icon,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ]),
          ),
        ),

        // special courses
        SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.only(right: 25, left: 25),
          child: CustomTitle(title: "Development Courses"),
        ),

        // The special Courses
        SizedBox(height: 30),
        Consumer<CourseProvider>(
          builder: (context, courseProvider, child) {
            return FutureBuilder<void>(
              future: _fetchCoursesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final designCourses = courseProvider.courses
                      .where((course) => course.category.title == 'Development')
                      .toList();
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 25, top: 10, bottom: 30),
                      child: Row(
                        children: List.generate(
                          designCourses.length,
                          (index) {
                            final course = designCourses[index];
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CourseDetailsScreen(course: course),
                                    ),
                                  );
                                },
                                child: CustomCourseCardExpand(
                                  thumbNail: course.image,
                                  videoAmount: course.videoAmount,
                                  title: course.title,
                                  userProfile: course.userProfilePicture,
                                  userName: course.UploadedBy,
                                  price: course.price,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                }
              },
            );
          },
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: getBody(),
    );
  }
}
