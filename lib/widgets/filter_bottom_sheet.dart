import 'package:flutter/material.dart';
import 'package:ya9in/models/category.dart';
import 'package:ya9in/shared/colors.dart';
import 'package:ya9in/widgets/custom_button.dart';
import 'package:ya9in/widgets/custom_filter_button.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  List<String> selectedCategories = [];
  String? selectedDuration;

  void toggleCategorySelection(String categoryTitle) {
    setState(() {
      if (selectedCategories.contains(categoryTitle)) {
        selectedCategories.remove(categoryTitle);
      } else {
        selectedCategories.add(categoryTitle);
      }
    });
  }

  void selectDuration(String duration) {
    setState(() {
      if (selectedDuration == duration) {
        selectedDuration = null;
      } else {
        selectedDuration = duration;
      }
    });
  }

  void applyFilters() {
    Navigator.pop(context, {
      'categories': selectedCategories,
      'duration': selectedDuration,
    });
  }

  void cancelFilters() {
    setState(() {
      selectedCategories.clear();
      selectedDuration = null;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    List<String> durations = [
      '30 minutes',
      '60 Minutes',
      '75 Minutes',
      '90 minutes',
    ];
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(25),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // categories
            Text(
              'Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: allCategories.map((category) {
                return CustomFilterButton(
                  title: category.title,
                  color: appPrimary,
                  isSelected: selectedCategories.contains(category.title),
                  onTap: () {
                    toggleCategorySelection(category.title);
                  },
                );
              }).toList(),
            ),

            // duration
            SizedBox(height: 20),
            Text(
              'Duration',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: durations.map((duration) {
                return CustomFilterButton(
                  title: duration,
                  color: appPrimary,
                  isSelected: selectedDuration == duration,
                  onTap: () {
                    selectDuration(duration);
                  },
                );
              }).toList(),
            ),

            // Apply and Cancel filters button
            SizedBox(height: 20),
            Divider(
              endIndent: 20,
            ),
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // cancel button
                  Expanded(
                    child: CustomButtonBox(
                      color: Colors.red,
                      isDisabled: false,
                      onTap: () {
                        cancelFilters();
                      },
                      title: 'Cancel Filters',
                    ),
                  ),
                  SizedBox(width: 20),
                  // apply button
                  Expanded(
                    child: CustomButtonBox(
                      color: appPrimary,
                      isDisabled: false,
                      onTap: () {
                        applyFilters();
                      },
                      title: 'Apply',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
