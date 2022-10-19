import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_app/cubit/cubit.dart';
import 'package:untitled/layout/shop_app/cubit/states.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/styles/colors.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return ConditionalBuilder(
          condition: true,
          builder: (context) => ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildListItem(context),
              separatorBuilder: (context, index) => myDivider(),
              itemCount: 10),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildListItem(context,
          {bool isOldPrise = true, bool isCart = false}) =>
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 130,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 130,
                child: Image(
                  image: NetworkImage(
                    'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/skwgyqrbfzhu6uyeh0gg/air-max-270-shoes-zTPvbr.png',
                  ),
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        'Product',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          'price',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            color: defaultColor,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Spacer(),
                        if (isCart)
                          CircleAvatar(
                            radius: 17,
                            backgroundColor: Colors.grey,
                            // (ShopAppCubit.get(context).carts![model.id])! ? Colors.red :

                            child: IconButton(
                                onPressed: () {
                                  //   ShopAppCubit.get(context).changeCartsItem(model.id);
                                },
                                icon: Icon(
                                  Icons.restore_from_trash_rounded,
                                  size: 18,
                                  color: Colors.white,
                                )),
                          ),
                        if (!isCart)
                          CircleAvatar(
                            radius: 17,
                            backgroundColor: Colors.white,
                            //(ShopAppCubit.get(context).favorites![model.id])! ? defaultColor :

                            child: IconButton(
                                onPressed: () {
                                  //          ShopAppCubit.get(context).changeFavItem(model.id);
                                },
                                icon: Icon(
                                  Icons.heart_broken_rounded,
                                  size: 22,
                                  color: defaultColor,
                                )),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
