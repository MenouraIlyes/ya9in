import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:ya9in/models/course.dart';
import 'package:ya9in/shared/colors.dart';
import 'package:ya9in/widgets/custom_button.dart';
import 'package:ya9in/widgets/custom_course_card.dart';

class ReviewScreen extends StatefulWidget {
  final Course course;
  const ReviewScreen({
    super.key,
    required this.course,
  });

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  double rating = 0.0;
  Widget getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course card
            CustomCourseCardShrink(
              thumbNail: widget.course.image,
              price: widget.course.price,
              title: widget.course.title,
              userName: widget.course.UploadedBy,
            ),

            // Stars
            SizedBox(height: 30),
            Center(
              child: Text(
                'Your overall rating for this course : ${rating}',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),

            Center(
              child: PannableRatingBar(
                rate: rating,
                items: List.generate(
                    5,
                    (index) => const RatingWidget(
                          selectedColor: Colors.yellow,
                          unSelectedColor: Colors.grey,
                          child: Icon(
                            Icons.star,
                            size: 48,
                          ),
                        )),
                onChanged: (value) {
                  setState(() {
                    rating = value;
                  });
                  print(value);
                },
              ),
            ),

            // Write a review
            SizedBox(height: 50),

            Text(
              'Add detailed review',
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            SizedBox(height: 10),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Write your review here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
      backgroundColor: appWhite,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: appSecondary,
        title: Text(
          'Rate the course',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: appWhite),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: appWhite),
          onPressed: () {
            Navigator.of(context).pop();
          },
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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                left: 5,
              ),
              child: Column(
                children: [
                  // Submit button
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: CustomButtonBox(
                      color: appPrimary,
                      title: 'Submit Review',
                      isDisabled: false,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
      body: getBody(),
    );
  }
}
