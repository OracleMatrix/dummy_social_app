import 'package:dummy_social_app/Pages/users_profile_page.dart';
import 'package:dummy_social_app/Provider/social_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ListTile buildAddCommentSection() {
  return ListTile(
    leading: const CircleAvatar(
      backgroundColor: Colors.grey,
      child: Text(
        "E",
        style: TextStyle(color: Colors.white),
      ),
    ),
    title: TextField(
      decoration: InputDecoration(
        hintText: "Share your thoughts here...",
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}

Padding buildCommentsAndLikesSection(
    BuildContext context, SocialProvider value, int index) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 17.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.comment,
              color: Colors.grey,
            ),
            const SizedBox(width: 8),
            // buildShowCommentsSheet(context, value, index),
            Text(
              "Comments",
              style: TextStyle(color: Colors.grey[700]),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "${value.getAllPosts?.posts?[index].reactions?.likes.toString()} Likes",
              style: const TextStyle(color: Color(0xff7C8491)),
            ),
            const SizedBox(width: 8),
            const Icon(
              CupertinoIcons.hand_thumbsup,
              color: Color(0xff7C8491),
            ),
          ],
        )
      ],
    ),
  );
}

// InkWell buildShowCommentsSheet(
//     BuildContext context, SocialProvider value, int index) {
//   return InkWell(
//     borderRadius: BorderRadius.circular(10),
//     onTap: () {
//       showModalBottomSheet(
//         useSafeArea: true,
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(15),
//           topRight: Radius.circular(15),
//         )),
//         isScrollControlled: true,
//         context: context,
//         builder: (context) {
//           return DraggableScrollableSheet(
//             expand: false,
//             initialChildSize: 0.5,
//             minChildSize: 0.1,
//             maxChildSize: 1.0,
//             builder: (context, scrollController) {
//               return value.po?[index].comments != null
//                   ? ListView.builder(
//                       padding: const EdgeInsets.all(10),
//                       controller: scrollController,
//                       shrinkWrap: true,
//                       itemCount: value.postModel?[index].comments?.length ?? 0,
//                       itemBuilder: (context, commentIndex) {
//                         final comment =
//                             value.postModel?[index].comments?[commentIndex];
//                         return Column(
//                           children: [
//                             ListTile(
//                               contentPadding: const EdgeInsets.all(10),
//                               leading: const CircleAvatar(
//                                   backgroundColor: Colors.grey,
//                                   child: Icon(
//                                     Icons.person,
//                                     color: Colors.white,
//                                   )),
//                               title: Text(comment?.author ?? "Unknown"),
//                               subtitle: Text(comment?.text ?? ""),
//                               trailing: const Icon(
//                                 Icons.favorite_border,
//                               ),
//                             ),
//                             const Divider(thickness: 1)
//                           ],
//                         );
//                       },
//                     )
//                   : const Center(
//                       child: Text("No comments found."),
//                     );
//             },
//           );
//         },
//       );
//     },
//     child: Text(
//       "Comments",
//       style: TextStyle(color: Colors.grey[700]),
//     ),
//   );
// }

Widget buildUserInfoOfPosts(
    SocialProvider value, int index, BuildContext context) {
  return ListTile(
    leading: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UsersProfilePage(
              email: value.allUsersModel?.users?[index].email ?? "email",
              firstName:
                  value.allUsersModel?.users?[index].firstName ?? "first name",
              lastName:
                  value.allUsersModel?.users?[index].lastName ?? "last name",
              username:
                  value.allUsersModel?.users?[index].username ?? "username",
              id: value.allUsersModel?.users?[index].id ?? 0,
              image: value.allUsersModel?.users?[index].image ?? "",
              age: value.allUsersModel?.users?[index].age ?? 0,
              birthday: value.allUsersModel?.users?[index].birthDate ?? "0-0-0",
            ),
          ),
        );
      },
      child: CircleAvatar(
        // backgroundColor: Colors.grey,
        backgroundImage: NetworkImage(
          value.allUsersModel?.users?[index].image.toString() ?? "",
        ),
      ),
    ),
    title: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UsersProfilePage(
              email: value.allUsersModel?.users?[index].email ?? "email",
              firstName:
                  value.allUsersModel?.users?[index].firstName ?? "first name",
              lastName:
                  value.allUsersModel?.users?[index].lastName ?? "last name",
              username:
                  value.allUsersModel?.users?[index].username ?? "username",
              id: value.allUsersModel?.users?[index].id ?? 0,
              image: value.allUsersModel?.users?[index].image ?? "",
              age: value.allUsersModel?.users?[index].age ?? 0,
              birthday: value.allUsersModel?.users?[index].birthDate ?? "0-0-0",
            ),
          ),
        );
      },
      child: Text(value.allUsersModel?.users?[index].firstName! ?? "user"),
    ),
    subtitle: Text(
      "@${value.allUsersModel?.users?[index].username ?? "username"}",
      style: const TextStyle(color: Color(0xff525F6F)),
    ),
  );
}
