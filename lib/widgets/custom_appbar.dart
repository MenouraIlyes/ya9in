import 'package:flutter/material.dart';
import 'package:ya9in/shared/colors.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({super.key});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // back button
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: appPrimary,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                Icons.arrow_back,
                size: 20,
                color: appWhite,
              ),
            ),
          ),

          // bookmark button

          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: appPrimary,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                Icons.bookmark,
                size: 20,
                color: appWhite,
              ),
            ),
          )
        ],
      ),
    );
  }
}
