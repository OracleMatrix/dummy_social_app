import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:dummy_social_app/Pages/home_page.dart';
import 'package:dummy_social_app/Pages/profile_page.dart';
import 'package:dummy_social_app/Pages/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentIndex = 0;
  List<Widget> pages = [
    const HomePage(),
    const SearchPage(),
    const ProfilePage(),
  ];

  List<IconData> icons = [
    CupertinoIcons.home,
    Icons.search,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Dummy Social"),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeColor: Colors.black,
        inactiveColor: Colors.grey,
        splashColor: Colors.grey,
        gapWidth: 1,
        icons: icons,
        activeIndex: currentIndex,
        onTap: (p0) {
          setState(() {
            currentIndex = p0;
          });
        },
      ),
    );
  }
}
