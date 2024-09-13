import 'package:dummy_social_app/Provider/social_provider.dart';
import 'package:dummy_social_app/Widgets/methods.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then(
      (value) {
        final posts =
            // ignore: use_build_context_synchronously
            Provider.of<SocialProvider>(context, listen: false);
        posts.getPosts();

            // ignore: use_build_context_synchronously
        final users = Provider.of<SocialProvider>(context, listen: false);
        users.getUsers();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF6F7FC),
        body: Consumer<SocialProvider>(
          builder: (context, value, child) {
            if (value.isLoading) {
              return Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.black,
                  size: 50,
                ),
              );
            } else {
              return ListView.builder(
                itemCount: value.allUsersModel?.users?.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color(0xffFDFDFD),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        buildUserInfoOfPosts(value, index, context),
                        ListTile(
                          title: Text(
                            value.getAllPosts?.posts?[index].body! ?? "Content",
                          ),
                        ),
                        const SizedBox(height: 40),
                        buildCommentsAndLikesSection(context, value, index),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: buildAddCommentSection(),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ));
  }
}
