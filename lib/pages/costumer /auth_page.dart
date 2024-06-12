import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rvw/pages/business/businesslist_page.dart';
// import 'home_page.dart';
import 'login_or_register_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key); // Remove const and accept an optional Key parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BusinesslistPage();
          } else {
            return LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
