import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  List<int> i = [
    3,
    5,
    4,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: Icon(
          Icons.menu_open,
        ),
        title: Text(
          'App',
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notification_important,
            ),
            onPressed: onNotification,
          ),
          IconButton(
            icon: Text(
              'hello',
            ),
            onPressed: () {
              print('hello');
            },
          ),
        ],
      ),
      body: Column(
        children: [],
      )
    );
  }

  void onNotification() {
    print('notification clicked');
  }
}
