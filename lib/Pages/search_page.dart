import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SearchBar(
            hintStyle: const WidgetStatePropertyAll(
              TextStyle(color: Colors.grey),
            ),
            padding: const WidgetStatePropertyAll(EdgeInsets.all(10)),
            leading: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            elevation: const WidgetStatePropertyAll(0),
            backgroundColor: WidgetStatePropertyAll(Colors.grey[200]),
            hintText: "Search...",
          ),
        ),
        const SizedBox(height: 200),
        const Column(
          children: [
            Icon(
              Icons.search,
              size: 90,
              color: Colors.grey,
            ),
            Text(
              "S E A R C H. . .",
              style: TextStyle(fontSize: 20),
            )
          ],
        )
      ],
    ));
  }
}
