import 'package:flutter/material.dart';

class ECommerceAppCartScreen extends StatelessWidget {

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      leading: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios
        ),
      ),
    ),
    body: Center(
      child: Text(
          'Cart Screen'
      ),
    ),
  );
}
}
