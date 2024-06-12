import 'package:flutter/material.dart';
import 'package:rvw/pages/business/business_register.dart'; // Import the correct file
import 'package:rvw/pages/costumer%20/login_pages.dart';

class LoginOrRegBusiness extends StatelessWidget {
  const LoginOrRegBusiness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return _LoginOrRegBusinessPage();
          },
        );
      },
    );
  }
}

class _LoginOrRegBusinessPage extends StatefulWidget {
  @override
  State<_LoginOrRegBusinessPage> createState() => _LoginOrRegBusinessPageState();
}

class _LoginOrRegBusinessPageState extends State<_LoginOrRegBusinessPage> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: togglePages,
      );
    } else {
      return BusinessRegister(
        onTap: togglePages,
      );
    }
  }
}
