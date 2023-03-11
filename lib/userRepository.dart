import 'dart:convert';

import 'package:http/http.dart' as http;

import 'user.dart';

class UserRepository {
  static const String apiUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse(apiUrl));
    final List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => User.fromJson(json)).toList();
  }
}
