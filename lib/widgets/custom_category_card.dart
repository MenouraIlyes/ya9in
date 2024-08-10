import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ya9in/datas/category_json.dart';
import 'package:ya9in/models/category.dart';
import 'package:ya9in/models/course.dart';
import 'package:ya9in/screens/category_screen.dart';
import 'package:ya9in/shared/colors.dart';

class CustomCategoryCard extends StatelessWidget {
  const CustomCategoryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(HomePageCategoryJson.length, (index) {
          return GestureDetector(
            onTap: () {
              List<Course> filteredCourses = Courses.where((course) {
                return course.category.title == HomeCategories[index].title;
              }).toList();

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryScreen(
                      courses: filteredCourses,
                      category: HomeCategories[index],
                    ),
                  ));
            },
            child: Container(
              height: size.width * .25,
              width: size.width * .25,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: appWhite,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15.0,
                    offset: Offset(0, 7),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 35.0,
                    width: 35.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: appTeriatery.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: appBackground.withOpacity(0.5),
                          spreadRadius: 0.0,
                          blurRadius: 6.0,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: Container(
                      child: Icon(
                        HomeCategories[index].icon,
                        color: appWhite,
                      ),
                    ),
                  ),
                  Text(
                    HomeCategories[index].title,
                    style: TextStyle(
                      color: appPrimary,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 0.0),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
