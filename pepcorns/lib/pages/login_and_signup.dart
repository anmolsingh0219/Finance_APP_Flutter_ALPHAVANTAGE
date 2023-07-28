import 'package:flutter/material.dart';
import 'package:pepcorns/pages/login_page.dart';
import 'package:pepcorns/pages/signup_page.dart';

class LoginAndSignup extends StatefulWidget {
  const LoginAndSignup({super.key});

  @override
  State<LoginAndSignup> createState() => _LoginAndSignupState();
}

class _LoginAndSignupState extends State<LoginAndSignup> {
  bool islogin = false;

  void togglePage() {
    setState(() {
      islogin = !islogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (islogin) {
      return LoginPage(
        onPressed: togglePage,
      );
    } else {
      return SignUpPage(
        onPressed: togglePage,
      );
    }
  }
}
