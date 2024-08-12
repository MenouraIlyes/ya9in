import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ya9in/shared/colors.dart';

class CustomExpandCard extends StatefulWidget {
  final String title;
  final FaIcon icon;
  final String contact;

  const CustomExpandCard({
    super.key,
    required this.title,
    required this.icon,
    required this.contact,
  });

  @override
  State<CustomExpandCard> createState() => _CustomExpandCardState();
}

class _CustomExpandCardState extends State<CustomExpandCard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      padding: const EdgeInsets.all(5.0),
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
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          title: Row(
            children: [
              // icon
              widget.icon,
              SizedBox(width: 10),
              // name
              Text(widget.title),
            ],
          ),
          trailing: const Icon(Icons.expand_more),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      endIndent: 20,
                      color: Colors.grey[200],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.contact,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
