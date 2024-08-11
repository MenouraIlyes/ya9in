class UserModel {
  String name;
  String age;
  final String role;
  String? email;
  String? phoneNumber;

  UserModel({
    required this.name,
    required this.age,
    required this.role,
    this.email,
    this.phoneNumber,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      name: data['name'] ?? '',
      age: data['age'] ?? '',
      role: data['role'] ?? '',
      email: data['email'] ?? '',
      phoneNumber: data['phone_number'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'role': role,
      'email': email,
      'phone_number': phoneNumber,
    };
  }
}
