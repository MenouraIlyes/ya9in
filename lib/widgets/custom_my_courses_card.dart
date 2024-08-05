import 'package:flutter/material.dart';
import 'package:ya9in/shared/colors.dart';

class CustomMyCoursesCard extends StatefulWidget {
  const CustomMyCoursesCard({
    Key? key,
    required this.image,
    required this.title,
    required this.instructor,
    required this.videoAmount,
    this.percentage = 0,
  }) : super(key: key);

  final String image;
  final String title;
  final String instructor;
  final String videoAmount;
  final double percentage;

  @override
  _CustomMyCoursesCardState createState() => _CustomMyCoursesCardState();
}

class _CustomMyCoursesCardState extends State<CustomMyCoursesCard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.9,
      height: size.width * 0.35,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: appWhite,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: size.width * 0.18,
            child: Row(
              children: [
                Container(
                  height: size.width * 0.15,
                  width: size.width * 0.15,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: appBackground,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Instructor: ' + widget.instructor,
                            style: TextStyle(
                              fontSize: 13.0,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '6/' + widget.videoAmount,
                            style: TextStyle(
                              fontSize: 13.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Stack(
                  alignment: Alignment.centerLeft,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: size.width * 0.85,
                      height: 6.0,
                      decoration: BoxDecoration(
                        color: appSecondary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                    Container(
                      width: widget.percentage * 2.8,
                      height: 8.0,
                      decoration: BoxDecoration(
                        color: appTeriatery,
                        borderRadius: BorderRadius.circular(100.0),
                        boxShadow: [
                          BoxShadow(
                            color: appBackground.withOpacity(0.5),
                            blurRadius: 6.0,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Container(
                width: 60,
                alignment: Alignment.centerRight,
                child: Text(
                  widget.percentage.toString() + '%',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: appTeriatery,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
