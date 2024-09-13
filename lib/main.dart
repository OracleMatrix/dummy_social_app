import 'package:dummy_social_app/Pages/login_and_signup_page.dart';
import 'package:dummy_social_app/Provider/social_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SocialProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dummy Social App',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
          useMaterial3: true,
        ),
        home: const LoginAndSignUpPage(),
      ),
    );
  }
}
