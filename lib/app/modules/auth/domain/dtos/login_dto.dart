import 'dart:convert';

class LoginDto {
  final String email;
  final String password;

  LoginDto(this.email, this.password);

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory LoginDto.fromMap(Map<String, dynamic> map) {
    return LoginDto(
      map['email'] ?? '',
      map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginDto.fromJson(String source) => LoginDto.fromMap(json.decode(source));
}
