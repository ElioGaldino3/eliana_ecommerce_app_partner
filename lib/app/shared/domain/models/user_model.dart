import 'dart:convert';

class UserModel {
  final String? id;
  final String name;
  final String? phone;
  final String? imageUrl;
  final String role;
  final String email;
  final String? password;
  final String? token;

  UserModel({
    this.id,
    required this.name,
    this.phone,
    this.imageUrl,
    required this.role,
    required this.email,
    this.password,
    this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'image_url': imageUrl,
      'role': role,
      'email': email,
      'password': password,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        id: map['id'],
        name: map['name'] ?? '',
        phone: map['phone'],
        imageUrl: map['image_url'],
        role: map['role'] ?? '',
        email: map['email'] ?? '',
        password: map['password'],
        token: map['token']);
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  factory UserModel.emptyUser() {
    return UserModel(name: '', role: 'user', email: '');
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}
