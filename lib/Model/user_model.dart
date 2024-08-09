// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String name;
  String password;
  String email;
  String id;
  String token;
  String image;
  UserModel({
    required this.name,
    required this.password,
    required this.email,
    required this.id,
    required this.token,
    required this.image,
  });

  UserModel copyWith({
    String? name,
    String? password,
    String? email,
    String? id,
    String? token,
    String? image,
  }) {
    return UserModel(
      name: name ?? this.name,
      password: password ?? this.password,
      email: email ?? this.email,
      id: id ?? this.id,
      token: token ?? this.token,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'password': password,
      'email': email,
      'id': id,
      'token': token,
      'image': image,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
      id: map['id'] as String,
      token: map['token'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, password: $password, email: $email, id: $id, token: $token, image: $image)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.password == password &&
        other.email == email &&
        other.id == id &&
        other.token == token &&
        other.image == image;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        password.hashCode ^
        email.hashCode ^
        id.hashCode ^
        token.hashCode ^
        image.hashCode;
  }
}
