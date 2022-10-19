import 'package:badges/badges.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_app/cubit/cubit.dart';
import 'package:untitled/layout/shop_app/cubit/states.dart';
import 'package:untitled/modules/shop_app/cart/cart_screen.dart';
import 'package:untitled/modules/shop_app/search/search_screen.dart';
import 'package:untitled/modules/shop_app/sidebar/sidebar_screen.dart';
import 'package:untitled/shared/components/components.dart';

class ShopLayoutScreen extends StatelessWidget {
  int index = 2;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);

        return Scaffold(
          drawer: ECommerceSideBarScreen(),
          appBar: AppBar(
            elevation: 8,
            title: Center(
              child: Text(
                     '     Home',
              ),
            ),
            actions:
            [
              Badge(
                badgeColor: Colors.deepPurpleAccent,
                badgeContent: Text('0',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                child: Container(
                  height: 46,
                  width: 46,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        blurRadius: 8
                      )
                    ]
                  ),
                  child: IconButton(
                    onPressed: ()
                    {
                      navigateTo(context, ECommerceAppCartScreen(),
                      );
                    },
                    icon: Icon(Icons.shopping_bag_outlined,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: CurvedNavigationBar(
            height: 45,
            backgroundColor: Colors.deepPurple,
            onTap: (index)
            {
              cubit.changeBottom(index);
            },
            items: [
              Icon(Icons.home, size: 20),
              Icon(Icons.category_rounded, size: 20),
              Icon(Icons.favorite_sharp, size: 20),
              Icon(Icons.settings, size: 20),
            ]
          ),
        );
      },
    );
  }
}
