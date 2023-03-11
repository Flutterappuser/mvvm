import 'package:flutter/material.dart';
import 'user.dart';
import 'userRepository.dart';

class UserListViewModel extends ChangeNotifier {
  final UserRepository userRepository = UserRepository();

  List<User> _users = [];

  List<User> get users => _users;

  Future<void> fetchUsers() async {
    _users = await userRepository.getUsers();
    notifyListeners();
  }
}
