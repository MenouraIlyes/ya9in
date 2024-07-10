import 'package:flutter/material.dart';
import 'package:ya9in/datas/category_json.dart';
import 'package:ya9in/shared/colors.dart';
import 'package:ya9in/widgets/custom_categories_button.dart';
import 'package:ya9in/widgets/custom_heading.dart';
import 'package:ya9in/widgets/custom_place_holder.dart';
import 'package:ya9in/widgets/custom_search_field.dart';
import 'package:ya9in/widgets/custom_title.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  Widget getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            SizedBox(height: 30),
            CustomHeading(
              title: 'Explore',
              subTitle: 'Seek for your preference',
              color: Colors.black,
            ),

            // Search bar
            SizedBox(height: 50),
            CustomSearchField(
              hintField: "Try 'Web Design' ",
              backgroundColor: appWhite,
            ),

            // Top Searches
            SizedBox(height: 50),
            CustomTitle(
              title: 'Top Searches',
              extend: false,
            ),
            SizedBox(height: 10),
            Wrap(
              runSpacing: 10,
              spacing: 10,
              children: List.generate(
                CategoryJson.length,
                (index) {
                  return CustomCategoriesButton(
                    title: CategoryJson[index]['title'],
                  );
                },
              ),
            ),

            // Categories
            SizedBox(height: 50),
            CustomTitle(
              title: 'Categories',
              extend: false,
            ),
            SizedBox(height: 10),
            Column(
              children: List.generate(
                AllCategories.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CunstomPlaceHolder(
                      title: AllCategories[index]['title'],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: getBody(),
    );
  }
}
