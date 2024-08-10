import 'package:flutter/material.dart';

class Category {
  final IconData icon;
  final String title;

  Category({
    required this.icon,
    required this.title,
  });

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      icon: map['icon'],
      title: map['title'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'icon': icon,
      'title': title,
    };
  }
}

List<Category> allCategories = [
  Category(
    icon: Icons.code,
    title: 'Code',
  ),
  Category(
    icon: Icons.calculate,
    title: 'Finance & Accounting',
  ),
  Category(
    icon: Icons.brush,
    title: 'Design',
  ),
  Category(
    icon: Icons.developer_board,
    title: 'Development',
  ),
  Category(
    icon: Icons.business,
    title: 'Business',
  ),
  Category(
    icon: Icons.app_settings_alt_outlined,
    title: 'IT & Software',
  ),
  Category(
    icon: Icons.camera_alt,
    title: 'Photography & Video',
  ),
  Category(
    icon: Icons.shopify_sharp,
    title: 'Marketing',
  ),
  Category(
    icon: Icons.person_add_alt_1,
    title: 'Lifestyle',
  ),
  Category(
    icon: Icons.local_post_office,
    title: 'Office Productivity',
  ),
  Category(
    icon: Icons.music_note,
    title: 'Music',
  ),
  Category(
    icon: Icons.person_off,
    title: 'Personal Development',
  ),
];

List<Category> TopCategories = [
  Category(
    icon: Icons.code,
    title: 'Code',
  ),
  Category(
    icon: Icons.calculate,
    title: 'Finance & Accounting',
  ),
  Category(
    icon: Icons.brush,
    title: 'Design',
  ),
  Category(
    icon: Icons.developer_board,
    title: 'Development',
  ),
  Category(
    icon: Icons.business,
    title: 'Business',
  ),
  Category(
    icon: Icons.app_settings_alt_outlined,
    title: 'IT & Software',
  ),
];
List<Category> BottomCategories = [
  Category(
    icon: Icons.camera_alt,
    title: 'Photography & Video',
  ),
  Category(
    icon: Icons.shopify_sharp,
    title: 'Marketing',
  ),
  Category(
    icon: Icons.person_add_alt_1,
    title: 'Lifestyle',
  ),
  Category(
    icon: Icons.local_post_office,
    title: 'Office Productivity',
  ),
  Category(
    icon: Icons.music_note,
    title: 'Music',
  ),
  Category(
    icon: Icons.person_off,
    title: 'Personal Development',
  ),
];

List<Category> HomeCategories = [
  Category(
    icon: Icons.code,
    title: 'Code',
  ),
  Category(
    icon: Icons.business,
    title: 'Business',
  ),
  Category(
    icon: Icons.brush,
    title: 'Design',
  ),
];
