import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 50),
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: CircleAvatar(
                        child: Text(
                          "E",
                          style: TextStyle(fontSize: 50),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Ehsan Mohammadpur",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "@ehsanmp",
                      style: TextStyle(fontSize: 15),
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
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Email : ehsanmohammadipoor@gmail.com",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Age : 25",
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "BirthDay : 2000-10-08",
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 5),
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
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Your Posts",
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color(0xffFDFDFD),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        const ListTile(
                          title: Text(
                            "This app maid by me Ehsan Mohammadipoor with Flutter\nThis is a Complete package with Authorization and State management and different API models",
                          ),
                        ),
                        const SizedBox(height: 40),
                        Padding(
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
                              const Row(
                                children: [
                                  Text(
                                    "1265 Likes",
                                    style: TextStyle(color: Color(0xff7C8491)),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(
                                    CupertinoIcons.hand_thumbsup,
                                    color: Color(0xff7C8491),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: ListTile(
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
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
