import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled/layout/social_app/cubit/cubit.dart';
import 'package:untitled/layout/social_app/cubit/states.dart';
import 'package:untitled/shared/components/components.dart';

class NewPostScreen extends StatelessWidget {

  var textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child:
                defaultAppBar(
                    context: context,
                    title: 'Create Post',
                    actions: [
              defaultTextButton(
                  function: () {
                    var now = DateTime.now();
                    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm'). format(now);
                    if (SocialCubit.get(context).postImage == null) {
                      SocialCubit.get(context)
                          .createPost(
                          dateTime: formattedDate,
                          text: textController.text,
                      );
                    } else
                    {
                      SocialCubit.get(context)
                          .uploadPostImage(
                          dateTime: now.toString(),
                          text: textController.text,
                      );
                    }
                  },
                  text: 'Post'),
            ]),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if(state is SocialCreatePostLoadingState)
                LinearProgressIndicator(),
                if(state is SocialCreatePostLoadingState)
                  SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage(
                          'https://scontent.faly2-1.fna.fbcdn.net/v/t39.30808-6/277758865_1657663211248151_6884161751649007335_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=a4a2d7&_nc_eui2=AeG8bdz6l68pxEvxvo83E6fsh1MMKzIdOjOHUwwrMh06MwTSpiZrul3J5X-C_Nul2sPOE-3Zj1kJyy5ZORAhPoJG&_nc_ohc=FDZQhDIAqUQAX8cNGU3&_nc_ht=scontent.faly2-1.fna&oh=00_AT9438Cepbodt5mYHbyRDsJYHhzKwMManx51Gf4vC5O0WA&oe=62D4EEC9'),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: Text(
                        'Mohamed Salah Ali',
                        style: TextStyle(
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                      hintText: 'What is on your mind',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                if(SocialCubit.get(context).postImage!=null)
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        image: DecorationImage(
                            image: FileImage(SocialCubit.get(context).postImage!),
                            fit: BoxFit.cover
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: ()
                      {
                        SocialCubit.get(context).removePostImage();
                      },
                      icon: CircleAvatar(
                        radius: 20.0,
                        child: Icon(
                          Icons.close_outlined,
                          size: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: ()
                        {
                          SocialCubit.get(context).getPostImage();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image_outlined,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text('Add photo'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: Text('# Tags'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
