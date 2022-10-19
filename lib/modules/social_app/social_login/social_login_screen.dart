import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/social_app/social_layout.dart';
import 'package:untitled/modules/social_app/social_login/cubit/cubit.dart';
import 'package:untitled/modules/social_app/social_login/cubit/states.dart';
import 'package:untitled/modules/social_app/social_register/social_register_screen.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/network/local/cache_helper.dart';

class SocialLoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailControl = TextEditingController();
  var passwordControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          SocialLoginCubit(SocialLoginInitialState),
      child: BlocConsumer<SocialLoginCubit, SocialLoginStates>(
        listener: (context, state) {
          if (state is SocialLoginErrorState) {
            showToast(text: state.error, state: ToastState.Error
            );

          }
          if (state is SocialLoginSuccessState) {
            CacheHelper.saveData(
              key: 'uid',
              value: state.uid,
            ).then((value)
            {
              navigateAndFinish(
                context,
                SocialLayout(),
              );
            });
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
                              'Login now to Communicate with friends',
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
                                    // SocialLoginCubit.get(context).userLogin(
                                    //      email: emailControl.text,
                                    //  password: passwordControl.text);
                                  }
                                },
                                validator: (value) {
                                  if (value.isEmpty)
                                    return 'Password is to Short';
                                  else
                                    return null;
                                },
                                isPassword:
                                    SocialLoginCubit.get(context).isPassword,
                                label: 'Password',
                                prefix: Icons.lock,
                                suffix: SocialLoginCubit.get(context).suffix,
                                suffixClicked: () {
                                  SocialLoginCubit.get(context)
                                      .changePasswordVisibility();
                                }),
                            SizedBox(
                              height: 15,
                            ),
                            ConditionalBuilder(
                              condition: state is! SocialLoginLoadingState,
                              builder: (context) => defaultButton(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    SocialLoginCubit.get(context).userLogin(
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
                                      SocialRegisterScreen(),
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
