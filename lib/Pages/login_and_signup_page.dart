import 'package:dummy_social_app/Pages/root_page.dart';
import 'package:dummy_social_app/Provider/social_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:provider/provider.dart';

class LoginAndSignUpPage extends StatelessWidget {
  const LoginAndSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FlutterLogin(
          initialAuthMode: AuthMode.signup,
      title: "Dummy Social",
      onSignup: (signUpData) async {
        final signUp = Provider.of<SocialProvider>(context, listen: false);
        try {
          await signUp.addUser(signUpData.name!, signUpData.password!);
          Navigator.pushReplacement(
              // ignore: use_build_context_synchronously
              context,
              MaterialPageRoute(
                builder: (context) => const RootPage(),
              ));
        } catch (error) {
          return "User already exists";
        }
        return null;
      },
      onLogin: (loginData) async {
        final login = Provider.of<SocialProvider>(context, listen: false);
        try {
          await login.loginUser(loginData.name, loginData.password);
          Navigator.pushReplacement(
              // ignore: use_build_context_synchronously
              context,
              MaterialPageRoute(
                builder: (context) => const RootPage(),
              ));
        } catch (error) {
          return "Invalid username or password";
        }
        return null;
      },
      onRecoverPassword: (p0) {
        return null;
      },
    ));
  }
}
