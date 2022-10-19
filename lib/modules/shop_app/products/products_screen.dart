import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_app/cubit/cubit.dart';
import 'package:untitled/layout/shop_app/cubit/states.dart';
import 'package:untitled/models/shop_app/home_model.dart';
import 'package:untitled/modules/shop_app/search/search_screen.dart';
import 'package:untitled/modules/shop_app/settings/settings_screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/styles/colors.dart';

class ProductsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              navigateTo(context,SearchScreen());
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.search,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                        'Search ...'
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: IconButton(
                            onPressed: ()
                            {
                              navigateTo(context, SettingsScreen(),);
                            },
                            icon: Icon(
                              Icons.settings,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        children: [
                          Text(
                            'Brands',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20
                            ),
                          ),
                          Spacer(),
                          TextButton(
                              onPressed: (){},
                              child: Text(
                                'View all',
                                style: TextStyle(
                                  color: defaultColor,
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 130,
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => buildCategoryItem([index]),
                          separatorBuilder:  (context, index) => SizedBox(width: 10,),
                          itemCount: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(

                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 7.0),
                            child: Text(
                              'Trending ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 2,
                                      color: defaultColor
                                  ),
                                )
                            ),
                            child: Text(
                              'Product',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => buildGridProduct(context, ShopCubit.get(context).eCommerceProductModel!.products![index],index),
                              separatorBuilder: (context, index) => SizedBox(
                                  height:10
                              ),
                              itemCount: ShopCubit.get(context).eCommerceProductModel!.products!.length
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Container(

                            margin: const EdgeInsetsDirectional.only(top: 40.0),
                            child: ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) => buildGridProduct(context, ShopCubit.get(context).eCommerceProductModel!.products![index],index),
                                separatorBuilder: (context, index) => SizedBox(
                                    height:10
                                ),
                                itemCount: ShopCubit.get(context).eCommerceProductModel!.products!.length
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'Best ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 2,
                                      color: defaultColor
                                  ),
                                )
                            ),
                            child: Text(
                              'Seller',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 180,
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => buildBestSellerProduct(context,index),
                          separatorBuilder:(context, index) =>  SizedBox(
                            width: 15,
                          ),
                          itemCount: 10
                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  width: double.infinity,
                  color: Colors.blue[900],
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Our Mission',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Colors.white
                          ),
                        ),
                        Text(
                          'So seed seed green that winged cattle in. Gathering thing made fly you\'re no divided deep moved us lan Gathering thing us land years living.',
                          style: TextStyle(
                            color: Colors.grey,
                            height: 1.5,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            'So seed seed green that winged cattle in. Gathering thing made fly you\'re no divided deep moved',
                            style: TextStyle(
                              color: Colors.grey,
                              height: 1.5,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                        ),

                        Text(
                          'Contact Us',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Colors.white
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue[800],
                              child: Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                              radius: 18,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Head Office',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '123,Main Street, Your City',
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.grey
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue[800],
                              child: Icon(
                                Icons.call,
                                color: Colors.white,
                              ),
                              radius: 18,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Phone Number',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '+123 456 7890',
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.grey
                                  ),
                                ),
                                Text(
                                  '+123 456 7890',
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.grey
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue[800],
                              child: Icon(
                                Icons.email_outlined,
                                color: Colors.white,
                              ),
                              radius: 18,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'mohamedmsalah3390@gmail.com',
                                  style: Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.grey
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },

    );
  }
  Widget buildCategoryItem( model)=> Container(
    width: 120,
    decoration: BoxDecoration(
    ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.grey[300],
            child: Image(
              height: 50,
              width: 50,
              image: NetworkImage(
                'https://c.static-nike.com/a/images/w_1920,c_limit/bzl2wmsfh7kgdkufrrjq/image.jpg',
              ),
            ),
          ),
        ),
        Text(
          'nike',
          style: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.bold
          ),
        ),
      ],
    ),
  );
  Widget buildGridProduct(context, ProductModel model,  int index) => InkWell(
    onTap: () {

    },
    child: Container(

      decoration: BoxDecoration(
        color:  Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Container(
                height: 200,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Image(
                  image: NetworkImage(
                    'https://calvinklein.scene7.com/is/image/CalvinKlein/21892280_540_main?wid=1500&hei=1975&fmt=jpeg&qlt=85%2C0&resMode=sharp2&op_usm=0.9%2C1.0%2C8%2C0&iccEmbed=0',
                  ),
                  width: double.infinity,
                  height: 200,
                  fit:   BoxFit.cover,
                ),
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  model.name,
                  style: TextStyle(
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      model.price,
                      style: TextStyle(
                        height: 1.4,
                        color: defaultColor,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    // if(model.oldPrice != 0)
                    //   Text(
                    //     '${model.oldPrice.round()}',
                    //     style: TextStyle(
                    //       height: 1.3,
                    //       color: Colors.grey,
                    //       decoration: TextDecoration.lineThrough,
                    //     ),
                    //   ),
                    Spacer(),
                    CircleAvatar(
                      radius: 17,
                      backgroundColor: Colors.grey[100],
                      child: IconButton(
                          onPressed: () {
                            // ShopAppCubit.get(context).changeFavItem(model.id);
                            // print(model.id);
                          },
                          icon: Icon(
                            Icons.heart_broken_rounded,
                            size: 20,
                            color: defaultColor,
                          )
                      ),
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
  Widget buildBestSellerProduct(context , int index) => InkWell(
    onTap: () {

    },
    child: Container(
      width: 160,
      decoration: BoxDecoration(
          color:  Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight:  Radius.circular(15),
            bottomRight:  Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black,
                offset: Offset(3,3),
                blurRadius: 3,
                spreadRadius: -1
            ),
            BoxShadow(
                color: Colors.white,
                offset: Offset(-5,5),
                blurRadius: 3,
                spreadRadius: -1
            ),
          ]
      ),
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Container(
            height: 180,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight:  Radius.circular(15),
                bottomRight:  Radius.circular(15),
              ),
            ),
            child: Image(
              image: NetworkImage(
                'https://i.ibb.co/F4CNQf9/product1.webp',
              ),
              width: double.infinity,
              fit:   BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 17,
              backgroundColor: Colors.grey[100],
              child: IconButton(
                  onPressed: () {
                    // ShopAppCubit.get(context).changeFavItem(model.id);
                    // print(model.id);
                  },
                  icon: Icon(
                    Icons.heart_broken_rounded,
                    size: 20,
                    color: defaultColor,
                  )
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
