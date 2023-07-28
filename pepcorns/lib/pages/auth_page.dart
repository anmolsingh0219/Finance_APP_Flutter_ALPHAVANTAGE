import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pepcorns/pages/asset_search.dart';
import 'package:pepcorns/pages/home_page.dart';
import 'package:pepcorns/pages/login_and_signup.dart';
import 'package:pepcorns/pages/login_page.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return const LoginAndSignup();
          }
        }
      },
    ));
  }
}
