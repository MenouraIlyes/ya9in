import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ya9in/shared/colors.dart';

class CunstomPlaceHolder extends StatefulWidget {
  const CunstomPlaceHolder(
      {Key? key, required this.title, this.isSwitch = false})
      : super(key: key);
  final String title;
  final bool isSwitch;

  @override
  _CunstomPlaceHolderState createState() => _CunstomPlaceHolderState();
}

class _CunstomPlaceHolderState extends State<CunstomPlaceHolder> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.width * .1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.grey,
            ),
          ),
          (widget.isSwitch)
              ? CupertinoSwitch(
                  value: switchValue,
                  activeColor: appPrimary,
                  onChanged: (bool newValue) {
                    setState(() {
                      switchValue = newValue;
                    });
                  },
                )
              : Icon(
                  Icons.arrow_outward_outlined,
                  color: appPrimary,
                ),
        ],
      ),
    );
  }
}
