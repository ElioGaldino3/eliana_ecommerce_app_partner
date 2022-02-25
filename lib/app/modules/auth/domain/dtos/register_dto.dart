import 'dart:convert';

class RegisterDto {
  final String name;
  final String email;
  final String password;

  RegisterDto(this.name, this.email, this.password);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory RegisterDto.fromMap(Map<String, dynamic> map) {
    return RegisterDto(
      map['name'] ?? '',
      map['email'] ?? '',
      map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterDto.fromJson(String source) => RegisterDto.fromMap(json.decode(source));
}
