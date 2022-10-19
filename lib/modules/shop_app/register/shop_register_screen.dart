import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_app/shop_layout_.dart';
import 'package:untitled/modules/shop_app/login/shop_login_screen.dart';
import 'package:untitled/modules/shop_app/register/cubit/cubit.dart';
import 'package:untitled/modules/shop_app/register/cubit/state.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';

class ShopRegisterScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneControl = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopRegisterCubit(ShopRegisterInitialState),

      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
        listener: (context, state) {
          if (state is ShopRegisterSuccessState) {
            print(state.loginModel.token);
            showToast(
                text:  'welcome',
                state: ToastState.Success
            );
            CacheHelper.saveData(
              key: 'token',
              value: state.loginModel.token,
            ).then((value) {
              token = CacheHelper.getData(key: 'token');
              navigateAndFinish(context, ShopLoginScreen());
            });
          }
          else if(state is ShopRegisterErrorState) {
            showToast(
                text:  'failed',
                state: ToastState.Error
            );
          }

        },
        builder: (context, state) {
          var cubit = ShopRegisterCubit.get(context);
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Register',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          'Register now to browse out hot offers',
                          style: Theme.of(context).textTheme.bodyText2,

                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultFormText(
                            control: nameController,
                            onTap: (){},
                            onChanged: (value){print(value);},
                            onSubmit: (){},
                            type: TextInputType.name,
                            validator: (value)
                            {
                              if(value.isEmpty)
                                return 'Name Can not be Empty';
                              else
                                return null;
                            },
                            label: 'User Name',
                            prefix: Icons.person),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(height: 15,),
                        defaultFormText(
                            control: emailController,
                            onTap: (){},
                            onChanged: (value){print(value);},
                            onSubmit: (){},
                            type: TextInputType.emailAddress,
                            validator: (value)
                            {
                              if(value.isEmpty)
                                return 'Email Can not be Empty';
                              else
                                return null;
                            },
                            label: 'Email Address',
                            prefix: Icons.email
                        ),

                        SizedBox(height: 15,),
                        defaultFormText(
                            control: passwordController,
                            type: TextInputType.visiblePassword,
                            onTap: (){},
                            onChanged: (value){print(value);},
                            onSubmit: (value) {},
                            validator: (value)
                            {
                              if(value.isEmpty)
                                return 'Password is to Short';
                              else
                                return null;
                            },
                            isPassword: ShopRegisterCubit.get(context).isPassword,
                            label: 'Password',
                            prefix: Icons.lock,
                            suffix: ShopRegisterCubit.get(context).suffix,
                            suffixClicked: (){
                              ShopRegisterCubit.get(context).changePasswordVisibility();
                            }
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        defaultFormText(
                            control: confirmPasswordController,
                            type: TextInputType.visiblePassword,
                            isPassword: cubit.isPassword,
                            suffix: cubit.suffix,
                            suffixClicked: (){
                              ShopRegisterCubit.get(context).changePasswordVisibility();
                            },
                            validator: (value){

                              if(passwordController.text != confirmPasswordController.text)
                              {
                                return 'password does\'nt match' ;
                              }

                              return null;
                            },
                            onTap: () {},
                            label: 'Confirm Password',
                            prefix: Icons.lock_outlined
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopRegisterLoadingState,
                          builder: (context) => Center(
                            child: defaultButton(
                                onTap:(){
                                  if(formKey.currentState!.validate())
                                  {
                                    ShopRegisterCubit.get(context).userRegister(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      phone: phoneControl.text,
                                      name: nameController.text,
                                    );
                                  }

                                },
                                text: 'Register',
                                radius: 10,
                                isUpperCase: true,
                                width: 200
                            ),
                          ),
                          fallback: (context) => Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}