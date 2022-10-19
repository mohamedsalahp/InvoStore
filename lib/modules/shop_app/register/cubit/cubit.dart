import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/shop_app/login_model.dart';
import 'package:untitled/modules/shop_app/register/cubit/state.dart';
import 'package:untitled/shared/network/end_points.dart';
import 'package:untitled/shared/network/remote/dio_helper.dart';


class ShopRegisterCubit extends Cubit<ShopRegisterStates>{
  ShopRegisterCubit(initialState) : super(ShopRegisterInitialState());
  static ShopRegisterCubit get(context)=>BlocProvider.of(context);
  late ShopLoginModel  loginModel;

  void userRegister({
  required String email,
  required String password,
  required String name,
  required String phone
}){
    emit(ShopRegisterLoadingState());
   DioHelper.postData(
     lang: 'en',
       url: REGISTER,
       data: {
         'email':email,
         'password':password,
         'name':name,
         'phone':phone,
       }).then((value) {
     loginModel= ShopLoginModel.formJson(value.data);
         emit(ShopRegisterSuccessState(loginModel));
   }).catchError((error){
     print(error.toString());
     emit(ShopRegisterErrorState(error.toString()));
   });
  }

IconData suffix=Icons.visibility_outlined;
 bool isPassword=false;
  void changePasswordVisibility()
  {
   isPassword=!isPassword;
   suffix=isPassword ? Icons.visibility_outlined:Icons.visibility_off;
   emit(ShopRegisterPasswordVisibility());
  }
}