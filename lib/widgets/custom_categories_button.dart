import 'package:flutter/material.dart';
import 'package:ya9in/shared/colors.dart';

class CustomCategoriesButton extends StatelessWidget {
  const CustomCategoriesButton({
    Key? key,
    required this.title,
    this.icon,
  }) : super(key: key);

  final String title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 10.0,
            bottom: 10.0,
          ),
          decoration: BoxDecoration(
            color: appTeriatery,
            borderRadius: BorderRadius.circular(100.0),
            boxShadow: [
              BoxShadow(
                color: appBackground.withOpacity(0.5),
                spreadRadius: 0.0,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            // icon
            if (icon != null) // Check if the icon is provided
              Icon(
                icon,
                color: appWhite,
              ),
            if (icon != null) const SizedBox(width: 8.0),
            //title
            Text(
              title,
              style: TextStyle(
                color: appWhite,
                fontSize: 15.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
