import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => UserListScreen(),
        '/details': (context) => UserDetailsScreen(),
      },
    );
  }
}

class UserListScreen extends StatelessWidget {
  final List<Map<String, String>> users = [
    {'id': '1', 'name': 'John Doe'},
    {'id': '2', 'name': 'Jane Smith'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User List')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user['name']!),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/details',
                arguments: user,
              );
            },
          );
        },
      ),
    );
  }
}

class UserDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> user = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(title: Text('User Details')),
      body: Center(
        child: Text(
          'User ID: ${user['id']}\nName: ${user['name']}',
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
