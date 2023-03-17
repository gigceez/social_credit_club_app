// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String id;
  final String username;
  final String birthdate;
  int rating;
  final Role role;
  User({
    required this.id,
    required this.username,
    required this.birthdate,
    required this.rating,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'role': role.name,
      'id': id,
      'rating': rating,
      'birthdate': birthdate,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      username: map['username'] as String,
      role: Role.values.byName(
        map['role'] as String,
      ),
      birthdate: map['birthdate'] as String,
      rating: map['rating'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}

enum Role {
  customer,
  club;
}
