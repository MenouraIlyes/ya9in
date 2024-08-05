import 'package:flutter/material.dart';
import 'package:ya9in/models/course.dart';
import 'package:ya9in/models/lesson.dart';
import 'package:ya9in/shared/colors.dart';
import 'package:ya9in/widgets/custom_appbar.dart';
import 'package:ya9in/widgets/custom_button.dart';
import 'package:ya9in/widgets/custom_categories_button.dart';
import 'package:ya9in/widgets/custom_heading.dart';
import 'package:ya9in/widgets/custom_lesson_card.dart';
import 'package:ya9in/widgets/custom_tab_view.dart';

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  int _selectedTag = 0;

  void changeTab(int index) {
    setState(() {
      _selectedTag = index;
    });
  }

  Widget Playlist() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0, right: 10, left: 10),
      child: Column(children: [
        ...List.generate(widget.course.lessons.length, (index) {
          return Column(
            children: [
              CustomLessonCard(
                lesson: widget.course.lessons[index],
              ),
              const SizedBox(height: 20),
            ],
          );
        }),
      ]),
    );
  }

  Widget Description() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        widget.course.description,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget getBody() {
    return Column(
      children: [
        // Top section
        Stack(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6.0,
                      offset: Offset(0.0, 2.0),
                    ),
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Image(
                  image: AssetImage(widget.course.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // tutor and rating and duration
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 5, top: 5, bottom: 5),
                      child: CustomCategoriesButton(
                        title: widget.course.userName,
                        icon: Icons.person,
                        color: appPrimary,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 5, right: 5, top: 5, bottom: 5),
                      child: CustomCategoriesButton(
                        title: '68 hours',
                        icon: Icons.watch_later,
                        color: appPrimary,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 5, right: 5, top: 5, bottom: 5),
                      child: CustomCategoriesButton(
                        title: '4.5 (365 reviews)',
                        icon: Icons.star,
                        color: appPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        // Bottom section
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // title
                CustomHeading(
                  title: widget.course.title,
                  subTitle: '',
                  color: Colors.black,
                ),

                // tab view
                CustomTabView(
                  changeTab: changeTab,
                  index: _selectedTag,
                ),
                Expanded(
                  child: SingleChildScrollView(
                      child: _selectedTag == 0 ? Playlist() : Description()),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: CustomAppbar(),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 1.0,
            spreadRadius: 1.0,
            offset: Offset(0.0, -1.0),
          )
        ]),
        child: BottomAppBar(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          notchMargin: 0,
          color: appWhite,
          surfaceTintColor: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Price
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Text(
                      'Total Price',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '${widget.course.price} DA',
                      style: TextStyle(
                        color: appPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // enroll button
              SizedBox(
                width: 200,
                height: 50,
                child: CustomButtonBox(
                  color: appPrimary,
                  isDisabled: false,
                  onTap: () {},
                  title: 'Enroll Now',
                ),
              ),
            ],
          ),
        ),
      ),
      body: getBody(),
    );
  }
}
