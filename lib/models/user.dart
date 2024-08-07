class UserModel {
  final String name;
  final String age;
  final String role;

  UserModel({required this.name, required this.age, required this.role});

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      name: data['name'] ?? '',
      age: data['age'] ?? '',
      role: data['role'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'role': role,
    };
  }
}
