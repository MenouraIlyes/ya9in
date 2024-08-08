import 'package:flutter/material.dart';
import 'package:ya9in/shared/colors.dart';

class CustomTabView extends StatefulWidget {
  final Function(int) changeTab;
  final int index;
  bool isEnrolled;

  CustomTabView({
    super.key,
    required this.changeTab,
    required this.index,
    this.isEnrolled = false,
  });

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  final List<String> _tags = ["Playlist", "Description"];

  Widget _buildTags(int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          widget.changeTab(index);
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 10,
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _tags[index],
                style: TextStyle(
                  color: widget.isEnrolled
                      ? (widget.index != index ? appWhite : appWhite)
                      : (widget.index != index ? Colors.black : appBackground),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (widget.index == index)
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  height: 4,
                  width: 150,
                  color: widget.isEnrolled ? appWhite : appBackground,
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.transparent,
          ),
          child: Row(
            children: _tags
                .asMap()
                .entries
                .map((MapEntry map) => _buildTags(map.key))
                .toList(),
          ),
        ),
      ],
    );
  }
}
