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
      width: size.width,
      height: size.width * .3,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: appWhite,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: size.width * .15,
            child: Row(
              children: [
                Container(
                  height: size.width * .13,
                  width: size.width * .13,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
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
                          fontSize: 13.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Intructor: ' + widget.instructor,
                            style: TextStyle(
                              fontSize: 11.0,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            '6/' + widget.videoAmount,
                            style: TextStyle(
                              fontSize: 11.0,
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
                      width: size.width,
                      height: 5.0,
                      decoration: BoxDecoration(
                        color: appSecondary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                    Container(
                      width: widget.percentage * 2.8,
                      height: 7.0,
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
              SizedBox(width: 10 * 2),
              Container(
                width: 50,
                alignment: Alignment.centerRight,
                child: Text(
                  widget.percentage.toString() + '%',
                  style: TextStyle(
                      fontSize: 13.0,
                      color: appTeriatery,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
