import 'package:flutter/material.dart';
import 'package:ya9in/screens/search_result_screen.dart';
import 'package:ya9in/shared/colors.dart';
import 'package:ya9in/widgets/filter_bottom_sheet.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({
    Key? key,
    required this.hintField,
    this.backgroundColor,
  }) : super(key: key);

  final String hintField;
  final Color? backgroundColor;

  @override
  _CustomSearchFieldState createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  final TextEditingController _searchController = TextEditingController();
  List<String> selectedCategories = [];
  String? selectedDuration;

  void _navigateToSearchResultScreen(BuildContext context, String query) {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          SearchResultScreen(
              searchQuery: query,
              categories: selectedCategories,
              duration: selectedDuration),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 600),
    ));
  }

  void _showFilterBottomSheet() async {
    final result = await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      builder: (context) => FilterBottomSheet(
        selectedCategories: selectedCategories,
        selectedDuration: selectedDuration,
      ),
    );

    if (result != null) {
      setState(() {
        selectedCategories = result['categories'] ?? [];
        selectedDuration = result['duration'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 50,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(7.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Search Icon
          Container(
            height: 40.0,
            width: 40.0,
            alignment: Alignment.center,
            child: Icon(
              Icons.search_rounded,
              color: appBackground,
            ),
          ),

          // Search Field
          Flexible(
            child: Container(
              width: size.width,
              height: 32,
              alignment: Alignment.topCenter,
              child: TextField(
                controller: _searchController,
                style: TextStyle(fontSize: 15),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: widget.hintField,
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: appBackground.withOpacity(0.5),
                  ),
                  border: InputBorder.none,
                ),
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    _navigateToSearchResultScreen(context, value);
                  }
                },
              ),
            ),
          ),
          SizedBox(width: 10.0),

          // Filter Icon
          Container(
            height: 40.0,
            width: 40.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: appTeriatery.withOpacity(0.7),
              borderRadius: BorderRadius.circular(7.0),
              boxShadow: [
                BoxShadow(
                  color: appBackground.withOpacity(0.5),
                  spreadRadius: 0.0,
                  blurRadius: 6.0,
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: GestureDetector(
              onTap: _showFilterBottomSheet,
              child: Icon(Icons.filter_list_alt),
            ),
          ),
        ],
      ),
    );
  }
}
