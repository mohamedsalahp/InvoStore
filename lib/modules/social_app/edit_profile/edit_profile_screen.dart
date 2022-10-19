import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/social_app/cubit/cubit.dart';
import 'package:untitled/layout/social_app/cubit/states.dart';
import 'package:untitled/shared/components/components.dart';

class EditProfileScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var profileModel = SocialCubit.get(context).userModel;
        var profileImage = SocialCubit.get(context).profileImage;
        var cover = SocialCubit.get(context).cover;

         nameController.text = profileModel!.name!;
         // biosController.text=profileModel.bios!;
        phoneController.text=profileModel.phone!;
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: defaultAppBar(
              context: context,
              title: 'Edit Profile',
              actions: [
                defaultTextButton(
                  function: () {
                    SocialCubit.get(context)
                        .updateUser(
                        name: nameController.text,
                        phone: phoneController.text,
                        bio: bioController.text
                    );
                  },
                  text: 'updates',
                ),
                SizedBox(
                  width: 15.0,
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children:
                [
                  if(state is SocialUserUpdateLoadingState)
                  LinearProgressIndicator(),
                  if(state is SocialUserUpdateLoadingState)
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 200,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 160,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    topLeft: Radius.circular(5),
                                  ),
                                  image: DecorationImage(
                                      image: cover == null
                                          ? NetworkImage('${profileModel.cover}')
                                          : FileImage(cover) as ImageProvider,
                                      fit: BoxFit.cover),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  SocialCubit.get(context).getcover();
                                },
                                icon: CircleAvatar(
                                  radius: 20.0,
                                  child: Icon(
                                    Icons.camera_alt_sharp,
                                    size: 16.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          alignment: AlignmentDirectional.topCenter,
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 64.0,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: profileImage == null
                                    ? NetworkImage('${profileModel.coverImage}')
                                    // دي الي هيا الصوره بس انا مسميها كده علشان ال database
                                    : FileImage(profileImage) as ImageProvider,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                SocialCubit.get(context).getProfileImage();
                              },
                              icon: CircleAvatar(
                                radius: 20.0,
                                child: Icon(
                                  Icons.camera_alt_sharp,
                                  size: 16.0,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if(SocialCubit.get(context).profileImage !=null || SocialCubit.get(context).cover !=null)
                  Row(
                    children:
                    [
                      if(SocialCubit.get(context).profileImage !=null)
                      Expanded(
                        child: Column(
                          children:
                          [
                            defaultButton(
                                onTap: ()
                                {
                                  SocialCubit.get(context).uploadProfileImage(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      bio: bioController.text,
                                  );
                                },
                                text: 'Upload Profile'
                            ),
                            if(state is SocialUserUpdateLoadingState)
                            SizedBox(
                              height: 5.0,
                           ),
                            if(state is SocialUserUpdateLoadingState)
                            LinearProgressIndicator(),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      if(SocialCubit.get(context).cover !=null)
                      Expanded(
                        child: Column(
                          children:
                          [
                            defaultButton(
                                onTap: ()
                                {
                                  SocialCubit.get(context).uploadcover(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    bio: bioController.text,
                                  );
                                },
                                text: 'Upload Cover'
                            ),
                            if(state is SocialUserUpdateLoadingState)
                            SizedBox(
                              height: 5.0,
                            ),
                            if(state is SocialUserUpdateLoadingState)
                            LinearProgressIndicator(),
                          ],
                        ),
                      ),
                    ],
                  ),
             //     if(SocialCubit.get(context).profileImage !=null || SocialCubit.get(context).cover !=null)
                  SizedBox(
                    height: 20,
                  ),
                  defaultFormText(
                    control: nameController,
                    type: TextInputType.name,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Name Cant be Empty';
                      }
                      return null;
                    },
                    label: 'Edit Name',
                    prefix: Icons.people,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  defaultFormText(
                    control: bioController,
                    type: TextInputType.text,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Bio Cant be Empty';
                      }
                      return null;
                    },
                    label: 'Bios',
                    prefix: Icons.info_sharp,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  defaultFormText(
                    control: phoneController,
                    type: TextInputType.phone,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'phone number Cant be Empty';
                      }
                      return null;
                    },
                    label: 'phone',
                    prefix: Icons.add_call,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
