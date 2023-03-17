import 'dart:convert';
import 'user.dart';

class AuthenticationResponse {
  final String token;
  final User user;
  AuthenticationResponse({
    required this.token,
    required this.user,
  });

  AuthenticationResponse copyWith({
    String? token,
    User? user,
  }) {
    return AuthenticationResponse(
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'user': user.toMap(),
    };
  }

  factory AuthenticationResponse.fromMap(Map<String, dynamic> map) {
    return AuthenticationResponse(
      token: map['token'] as String,
      user: User.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthenticationResponse.fromJson(String source) =>
      AuthenticationResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() => 'AuthenticationResponse(token: $token, user: $user)';
}
