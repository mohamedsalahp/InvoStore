import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_app/cubit/states.dart';
import 'package:untitled/models/shop_app/home_model.dart';
import 'package:untitled/modules/shop_app/categories/categories_screen.dart';
import 'package:untitled/modules/shop_app/favorites/favorites_screen.dart';
import 'package:untitled/modules/shop_app/products/products_screen.dart';
import 'package:untitled/modules/shop_app/settings/settings_screen.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/end_points.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';

class ShopCubit extends Cubit<ShopStates>
{
  ShopCubit(ShopStates initialState) : super(initialState);

  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List <Widget> bottomScreens = [
    ProductsScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  List<String> title = [
    'Home'
    'Category'
    'Favorites'
    'Settings'
  ];
  void changeBottom(int index)
  {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  ECommerceProductModel? eCommerceProductModel;

  //Map<int,bool>favourite= {};
  void getProduct(){
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(
      url: 'allproducts',
      token: token,
    ).then((value) {
      eCommerceProductModel = ECommerceProductModel.fromJson(value.data);

      print(eCommerceProductModel!.products![0].name);
      emit(ShopSuccessHomeDataState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }
}