import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/shop_app/login_model.dart';
import 'package:untitled/modules/shop_app/login/cubit/states.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';
import '../../../../shared/network/end_points.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>{
  ShopLoginCubit(initialState) : super(ShopLoginInitialState());

  static ShopLoginCubit get(context)=>BlocProvider.of(context);

 late ShopLoginModel loginModel;

  void userLogin({
    required String email,
    required String password
  }){
    emit(ShopLoginLoadingState());
    DioHelper.postData(
        lang: 'ar',
        url: LOGIN,
        data: {
          'email':email,
          'password':password,
        }).then((value)
    {
      print(value.data);
     loginModel = ShopLoginModel.formJson(value.data);
      emit(ShopLoginSuccessState(loginModel));
    }).catchError((error){
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }

  IconData suffix=Icons.visibility_outlined;
  bool isPassword=false;
  void changePasswordVisibility()
  {
    isPassword=!isPassword;
    suffix=isPassword ? Icons.visibility_outlined:Icons.visibility_off;
    emit(ShopChangePasswordVisibilityState());
  }
}