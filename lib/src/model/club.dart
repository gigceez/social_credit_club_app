import 'dart:convert';
import 'user.dart';

class Club {
  final String id;
  final String name;
  final String ownerId;
  final List<User> users;
  Club({
    required this.name,
    required this.ownerId,
    required this.users,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'users': users.map((x) => x.toMap()).toList(),
      'ownerId': ownerId,
      'id': id,
    };
  }

  factory Club.fromMap(Map<String, dynamic> map) {
    return Club(
      id: map['id'] as String,
      name: map['name'] as String,
      users: List<User>.from(
        (map['users'] as List<int>).map<User>(
          (x) => User.fromMap(x as Map<String, dynamic>),
        ),
      ),
      ownerId: map['ownerId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Club.fromJson(String source) =>
      Club.fromMap(json.decode(source) as Map<String, dynamic>);
}
