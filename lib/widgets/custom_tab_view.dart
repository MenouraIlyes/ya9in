import 'package:flutter/material.dart';
import 'package:ya9in/shared/colors.dart';

class CustomTabView extends StatefulWidget {
  final Function(int) changeTab;
  final int index;
  const CustomTabView({
    super.key,
    required this.changeTab,
    required this.index,
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
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: widget.index == index ? appBackground : null,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(
            _tags[index],
            style: TextStyle(
              color: widget.index != index ? Colors.black : appWhite,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: appInversePrimary.withOpacity(0.5),
      ),
      child: Row(
        children: _tags
            .asMap()
            .entries
            .map((MapEntry map) => _buildTags(map.key))
            .toList(),
      ),
    );
  }
}
