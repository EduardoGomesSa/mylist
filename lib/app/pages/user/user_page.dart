import 'package:flutter/material.dart';
import 'package:mylist/app/models/user_model.dart';
import 'package:mylist/app/repositories/user_repository.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  UserPageState createState() => UserPageState();
}

class UserPageState extends State<UserPage> {
  List<UserModel>? _listUser = [];

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
  final users = await UserRepository().getAll();
  setState(() {
    _listUser = users;
  });
  }

  @override
  Widget build(BuildContext context) {
    if (_listUser == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
    appBar: AppBar(
      title: const Text('Lista de Usuários'),
    ),
    body: ListView.builder(
      itemCount: _listUser?.length,
      itemBuilder: (BuildContext context, int index) {
        final user = _listUser[index];
        return ListTile(
          title: Text(user?.name),
          subtitle: Text(user?.email),
          // ...
        );
      },
    ),
  );
  }
}
