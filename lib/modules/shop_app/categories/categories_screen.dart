import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_app/cubit/cubit.dart';
import 'package:untitled/layout/shop_app/cubit/states.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context,state){},
      builder: (context,state)=>ListView.separated(
          physics: BouncingScrollPhysics() ,
          itemBuilder: (context,index)=>catList([index]),
          separatorBuilder:  (context, index) => SizedBox(width: 10,),
          itemCount: 6
      ),
    );
  }
  Widget catList(model)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(
          image: NetworkImage('https://i.ibb.co/9G9m8dY/product3.webp'),
          height: 80,
          width: 80,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 40,),
        Text(
          'Light Bulb',
          style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 20
          ),
        ),
        Spacer(),
        IconButton(onPressed: (){},
            icon: Icon(Icons.arrow_forward_ios))
      ],
    ),
  );
}