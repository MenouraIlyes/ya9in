import 'package:flutter/material.dart';
import 'package:ya9in/shared/colors.dart';

class CustomButtonBox extends StatelessWidget {
  const CustomButtonBox({
    Key? key,
    required this.title,
    required this.onTap,
    required this.isDisabled,
  }) : super(key: key);

  final String title;
  final Function()? onTap;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        width: size.width,
        height: 45.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isDisabled ? Colors.grey[400] : appPrimary.withOpacity(0.7),
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
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
            color: appWhite,
          ),
        ),
      ),
    );
  }
}
