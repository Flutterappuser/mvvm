import 'package:flutter/material.dart';
import 'homepage.dart';
import 'foundation/userListViewModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserListViewModel userListViewModel = UserListViewModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVVM Example',
      home: FutureBuilder(
        future: userListViewModel.fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return HomePage(users: userListViewModel.users);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
