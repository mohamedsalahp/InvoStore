import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent[700],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  bottom: 16,
                  left: 48,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white12,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          'https://scontent.faly2-1.fna.fbcdn.net/v/t39.30808-6/277758865_1657663211248151_6884161751649007335_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=a4a2d7&_nc_ohc=eQdIQus0D5QAX_21boH&tn=JzLFlryETAZKXG9X&_nc_ht=scontent.faly2-1.fna&oh=00_AT9ppvfQ59-0pqVu0aoQKBmlOcUsu4VxqClcch-5eF2hww&oe=63065F09',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'BlazeOnsim',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

