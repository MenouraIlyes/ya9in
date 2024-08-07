import 'package:flutter/material.dart';
import 'package:ya9in/shared/colors.dart';

class CustomFilterButton extends StatelessWidget {
  const CustomFilterButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.color,
    required this.isSelected,
  }) : super(key: key);

  final String title;
  final Function()? onTap;
  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 45.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.7) : Colors.grey[400],
          borderRadius: BorderRadius.circular(17.5),
          boxShadow: [
            BoxShadow(
              color: appPrimary.withOpacity(0.5),
              spreadRadius: 0.0,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          // title
          Text(
            title,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w700,
              color: appWhite,
            ),
          ),
        ]),
      ),
    );
  }
}
