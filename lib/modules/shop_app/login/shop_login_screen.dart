import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/shop_app/shop_layout_.dart';
import 'package:untitled/modules/shop_app/login/cubit/cubit.dart';
import 'package:untitled/modules/shop_app/login/cubit/states.dart';
import 'package:untitled/modules/shop_app/register/shop_register_screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/constants.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';

class ShopLoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailControl = TextEditingController();
  var passwordControl = TextEditingController();

  ShopLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(ShopLoginInitialState),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
          if (state is ShopLoginSuccessState) {
            if (state.loginModel.token != null) {
              print(state.loginModel.token);
              showToast(
                  text:  'welcome',
                  state: ToastState.Success
              );
              CacheHelper.saveData(
                      key: 'token',
                  value: state.loginModel.token,
              )
                  .then((value) {
                token=CacheHelper.getData(key: 'token');
                navigateAndFinish(context, ShopLayoutScreen());
              });
            } else {
              showToast(
                  text:  'failed',
                  state: ToastState.Error
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(color: Colors.black),
                            ),
                            Text(
                              'Login now to Browse Our Invo Store',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            defaultFormText(
                                control: emailControl,
                                onTap: () {},
                                onChanged: (value) {
                                  print(value);
                                },
                                onSubmit: () {},
                                type: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value.isEmpty)
                                    return 'Email Can not be Empty';
                                  else
                                    return null;
                                },
                                label: 'Email',
                                prefix: Icons.email),
                            SizedBox(
                              height: 15,
                            ),
                            defaultFormText(
                                control: passwordControl,
                                type: TextInputType.visiblePassword,
                                onTap: () {},
                                onChanged: (value) {
                                  print(value);
                                },
                                onSubmit: (value) {
                                  if (formKey.currentState!.validate()) {
                                    ShopLoginCubit.get(context).userLogin(
                                        email: emailControl.text,
                                        password: passwordControl.text);
                                  }
                                },
                                validator: (value) {
                                  if (value.isEmpty)
                                    return 'Password is to Short';
                                  else
                                    return null;
                                },
                                isPassword:
                                    ShopLoginCubit.get(context).isPassword,
                                label: 'Password',
                                prefix: Icons.lock,
                                suffix: ShopLoginCubit.get(context).suffix,
                                suffixClicked: () {
                                  ShopLoginCubit.get(context)
                                      .changePasswordVisibility();
                                }),
                            SizedBox(
                              height: 15,
                            ),
                            ConditionalBuilder(
                              condition: state is! ShopLoginLoadingState,
                              builder: (context) => defaultButton(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    ShopLoginCubit.get(context).userLogin(
                                        email: emailControl.text,
                                        password: passwordControl.text);
                                  }
                                },
                                text: 'Login',
                              ),
                              fallback: (context) =>
                                  Center(child: CircularProgressIndicator()),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't Have an Account?",
                                  style: TextStyle(fontSize: 15),
                                ),
                                defaultTextButton(
                                  function: () {
                                    navigateTo(
                                      context,
                                      ShopRegisterScreen(),
                                    );
                                  },
                                  text: 'register',
                                )
                              ],
                            ),
                          ]),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
