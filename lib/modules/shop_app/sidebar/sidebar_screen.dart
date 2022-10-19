import 'package:flutter/material.dart';
import 'package:untitled/modules/shop_app/cart/cart_screen.dart';
import 'package:untitled/modules/shop_app/settings/settings_screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/cubit/cubit.dart';
import 'package:untitled/shared/styles/colors.dart';
import 'package:url_launcher/url_launcher.dart';


class ECommerceSideBarScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 8,
      backgroundColor: Colors.white ,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('BlazeOnsim'),
            accountEmail: Text('mohamedmsalah3390@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image(
                  height: 200,
                  image: NetworkImage(
                    'https://scontent.faly2-1.fna.fbcdn.net/v/t39.30808-6/277758865_1657663211248151_6884161751649007335_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=a4a2d7&_nc_ohc=eQdIQus0D5QAX_21boH&tn=JzLFlryETAZKXG9X&_nc_ht=scontent.faly2-1.fna&oh=00_AT9ppvfQ59-0pqVu0aoQKBmlOcUsu4VxqClcch-5eF2hww&oe=63065F09',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: defaultColor,
              // image: DecorationImage(
              //   image: NetworkImage(
              //     ''
              //   ),
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person,),
            title: Text('Profile'),
            onTap: ()=> navigateTo(context, SettingsScreen()),
          ),
          ListTile(
            leading: Icon(
                AppCubit.get(context).isDark ?
                Icons.brightness_4_outlined : Icons.brightness_3_outlined
            ),
            title: Text(
                AppCubit.get(context).isDark ?
                'light' :'dark'
            ),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart_outlined),
            title: Text('Cart'),
            onTap: ()=> navigateTo(context, ECommerceAppCartScreen()),
          ),
          ListTile(
            leading: Icon(Icons.discord_sharp),
            title: Text('Discord'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout,color: Colors.black,),
            title: Text('Logout',
              style: TextStyle(
                color: Colors.deepPurpleAccent
              ),
            ),
          ),
        ],
      ),
    );
  }
}