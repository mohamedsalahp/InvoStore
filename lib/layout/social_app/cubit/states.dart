abstract class SocialStates {}

class SocialInitialStates extends SocialStates{}

class SocialGetUsersLoadingState extends SocialStates{}

class SocialGetUsersSuccessState extends SocialStates{}

class SocialGetUsersErrorState extends SocialStates
{
  final String error;

  SocialGetUsersErrorState(this.error);
}

class SocialGetAllUsersLoadingState extends SocialStates{}

class SocialGetAllUsersSuccessState extends SocialStates{}

class SocialGetAllUsersErrorState extends SocialStates
{
  final String error;

  SocialGetAllUsersErrorState(this.error);
}

class SocialGetPostsLoadingState extends SocialStates{}

class SocialGetPostsSuccessState extends SocialStates{}

class SocialGetPostsErrorState extends SocialStates
{
  final String error;

  SocialGetPostsErrorState(this.error);
}


class SocialLikePostsSuccessState extends SocialStates{}

class SocialLikePostsErrorState extends SocialStates
{
  final String error;

  SocialLikePostsErrorState(this.error);
}

class SocialChangeBottomNavState extends SocialStates {}

class SocialNewPostState extends SocialStates {}

class SocialProfileImagePickedSuccessState extends SocialStates {}

class SocialProfileImagePickedErrorState extends SocialStates {}

class SocialCoverImagePickedSuccessState extends SocialStates {}

class SocialCoverImagePickedErrorState extends SocialStates {}

class SocialUploadProfileImageSuccessState extends SocialStates {}

class SocialUploadProfileImageErrorState extends SocialStates {}

class SocialUploadCoverImageSuccessState extends SocialStates {}

class SocialUploadCoverImageErrorState extends SocialStates {}

class SocialUserUpdateLoadingState extends SocialStates {}

class SocialUserUpdateErrorState extends SocialStates {}

// Create Post //
class SocialCreatePostLoadingState extends SocialStates {}

class SocialCreatePostSuccessState extends SocialStates {}

class SocialCreatePostErrorState extends SocialStates {}

class SocialPostImagePickedSuccessState extends SocialStates {}

class SocialPostImagePickedErrorState extends SocialStates {}

class SocialRemovePostImageState extends SocialStates {}

// Chat //

class SocialSendMessageSuccessState extends SocialStates {}

class SocialSendMessageErrorState extends SocialStates {}

class SocialGetMessageSuccessState extends SocialStates {}

class SocialGetMessageErrorState extends SocialStates {}


/// BlocConsumer<SocialCubit, SocialStates>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           return Scaffold(
//               appBar: AppBar(
//                 titleSpacing: 0.0,
//                 title: Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 20.0,
//                       backgroundImage: NetworkImage(
//                         '${userModel.coverImage}',
//                       ),
//                     ),
//                     SizedBox(
//                       width: 15.0,
//                     ),
//                     Text(
//                         '${userModel.name}'
//                     ),
//                   ],
//                 ),
//               ),
//               body: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   children:
//                   [
//                     buildMessage(),
//                     buildMyMessage(),
//                     Spacer(),
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                             color: Colors.grey,
//                             width: 1.0
//                         ),
//                         borderRadius: BorderRadius.circular(15.0,),
//                       ),
//                       clipBehavior: Clip.antiAliasWithSaveLayer,
//                       child: Row(
//                         children:
//                         [
//                           Expanded(
//                             child: TextFormField(
//                               controller: messageController,
//                               decoration: InputDecoration(
//                                 border: InputBorder.none,
//                                 hintText: ' Type your message here ....',
//                               ),
//                             ),
//                           ),
//                           Container(
//                             height: 50.0,
//                             color: defaultColor,
//                             child: MaterialButton(
//                               onPressed: ()
//                               {
//                                 SocialCubit.get(context).sendMessage(
//                                     receiverId: userModel.uid!,
//                                     text: messageController.text,
//                                     dataTime: DateTime.now().toLocal().toString(),
//                                 );
//                               },
//                               minWidth: 1.0,
//                               child: Icon(
//                                   Icons.send_rounded,
//                                   size: 16.0,
//                                   color: Colors.white
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//           );
//         },
//       )

