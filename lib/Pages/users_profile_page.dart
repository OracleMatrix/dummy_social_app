import 'package:dummy_social_app/Provider/social_provider.dart';
import 'package:dummy_social_app/Widgets/methods.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class UsersProfilePage extends StatefulWidget {
  final int id;
  final String firstName, lastName, email, username, image, birthday;
  final int age;

  const UsersProfilePage({
    super.key,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.image,
    required this.age,
    required this.birthday,
  });

  @override
  State<UsersProfilePage> createState() => _UsersProfilePageState();
}

class _UsersProfilePageState extends State<UsersProfilePage> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then(
      (value) {
        final posts =
            // ignore: use_build_context_synchronously
            Provider.of<SocialProvider>(context, listen: false);
        posts.getUserPostById(widget.id);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
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
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(height: 50),
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(widget.image),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "${widget.firstName} ${widget.lastName}",
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            "@${widget.username}",
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    Card(
                      color: Colors.grey[200],
                      elevation: 0,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Email : ${widget.email}",
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Age : ${widget.age}",
                                style: const TextStyle(fontSize: 15),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "BirthDay : ${widget.birthday}",
                                style: const TextStyle(fontSize: 15),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Center(
                      child: Card(
                          elevation: 0,
                          color: Colors.grey[300],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${widget.firstName}'s Posts",
                              style: const TextStyle(fontSize: 20),
                            ),
                          )),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: value.getUserPost?.posts?.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: const Color(0xffFDFDFD),
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  value.getUserPost?.posts?[index].body! ??
                                      "Content",
                                ),
                              ),
                              const SizedBox(height: 40),
                              buildCommentsAndLikesSection(
                                  context, value, index),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 30),
                                child: buildAddCommentSection(),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              );
            }
          },
        ));
  }
}
