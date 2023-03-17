import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../model/authenticationresponse.dart';
import '../model/user.dart';

const url = 'https://a84a-185-10-158-5.ngrok.io/';

Future<AuthenticationResponse> login(String username, String password) async {
  var response = await http.post(
    Uri.parse('$url/login'),
    body: jsonEncode({
      'username': username,
      'password': password,
    }),
  );

  if (response.statusCode != 200) {
    throw Exception();
  }

  var result = AuthenticationResponse.fromJson(response.body);
  await saveToken(result.token);

  return result;
}

Future<User> getCurrentUser() async {
  var response = await http.get(Uri.parse('$url/users'),
      headers: {'authorization': await getToken()});

  if (response.statusCode != 200) {
    throw Exception();
  }

  var result = User.fromJson(response.body);

  print(result.username);

  return result;
}

Future<List<User>> getAllUsersFromClub() async {
  var response = await http.get(Uri.parse('$url/clubs/users'),
      headers: {'authorization': await getToken()});

  if (response.statusCode != 200) {
    throw Exception();
  }

  List<User> result = (json.decode(response.body) as List)
      .map((data) => User.fromJson(data))
      .toList();

  return result;
}

Future<User> getUserById(String id) async {
  var response = await http.get(Uri.parse('$url/users/$id'),
      headers: {'authorization': await getToken()});

  if (response.statusCode != 200) {
    throw Exception();
  }

  var result = User.fromJson(response.body);

  return result;
}

Future<void> saveToken(String token) async {
  var preferences = await SharedPreferences.getInstance();
  await preferences.setString('token', token);
}

Future<String> getToken() async {
  var preferences = await SharedPreferences.getInstance();
  return preferences.getString('token') ?? '';
}
