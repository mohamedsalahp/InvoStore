import 'package:flutter/material.dart';
import 'package:untitled/models/user/user_model.dart';


class UsersScreen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(
      id: 1,
      name: 'Mohamed Salah',
      phone: '+20101019121530',
    ),
    UserModel(
      id: 2,
      name: 'Hossam',
      phone: '+2010101964570',
    ),
    UserModel(
      id: 3,
      name: 'Ahmed',
      phone: '+201010643789',
    ),
    UserModel(
      id: 1,
      name: 'Mohamed Salah',
      phone: '+20101019121530',
    ),
    UserModel(
      id: 2,
      name: 'Hossam',
      phone: '+2010101964570',
    ),
    UserModel(
      id: 3,
      name: 'Ahmed',
      phone: '+201010643789',
    ),
    UserModel(
      id: 1,
      name: 'Mohamed Salah',
      phone: '+20101019121530',
    ),
    UserModel(
      id: 2,
      name: 'Hossam',
      phone: '+2010101964570',
    ),
    UserModel(
      id: 3,
      name: 'Ahmed',
      phone: '+201010643789',
    ),
    UserModel(
      id: 1,
      name: 'Mohamed Salah',
      phone: '+20101019121530',
    ),
    UserModel(
      id: 2,
      name: 'Hossam',
      phone: '+2010101964570',
    ),
    UserModel(
      id: 3,
      name: 'Ahmed',
      phone: '+201010643789',
    ),
  ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildUsersItem(users[index]),
          separatorBuilder: (context, index)=> Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          itemCount: users.length,
      ),
    );
  }
  Widget buildUsersItem(UserModel user) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children:
      [
        CircleAvatar(
          radius: 25.0,
          child: Text(
            '${user.id}',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: 25.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user.name}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${user.phone}',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
