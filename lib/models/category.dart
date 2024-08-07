class Category {
  final String icon;
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
    icon: 'assets/images/code_icon.svg',
    title: 'Code',
  ),
  Category(
    icon: 'assets/images/bag_icon.svg',
    title: 'Finance & Accounting',
  ),
  Category(
    icon: 'assets/images/brush_icon.svg',
    title: 'Design',
  ),
  Category(
    icon: 'assets/images/bag_icon.svg',
    title: 'Development',
  ),
  Category(
    icon: 'assets/images/bag_icon.svg',
    title: 'Business',
  ),
  Category(
    icon: 'assets/images/bag_icon.svg',
    title: 'IT & Software',
  ),
  Category(
    icon: 'assets/images/bag_icon.svg',
    title: 'Photography & Video',
  ),
  Category(
    icon: 'assets/images/bag_icon.svg',
    title: 'Marketing',
  ),
  Category(
    icon: 'assets/images/bag_icon.svg',
    title: 'Lifestyle',
  ),
  Category(
    icon: 'assets/images/bag_icon.svg',
    title: 'Office Productivity',
  ),
  Category(
    icon: 'assets/images/bag_icon.svg',
    title: 'Music',
  ),
  Category(
    icon: 'assets/images/bag_icon.svg',
    title: 'Personal Development',
  ),
];
