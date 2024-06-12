import 'package:flutter/material.dart';
import 'package:rvw/pages/costumer%20/home_page.dart';
import 'package:rvw/pages/costumer%20/login_or_register_page.dart';
import 'package:rvw/pages/costumer%20/profile_page.dart';
import 'package:rvw/pages/user_type_selection_page.dart'; // Import your user type selection page file here
import 'package:firebase_core/firebase_core.dart';
import 'package:rvw/pages/business/businesslist_page.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserTypeSelectionPage(),

      routes: {
        '/login_register_page':(context) => const LoginOrRegisterPage(),
        '/profile_page':(context) =>  ProfilePage(),
        '/homepage': (context) => const BusinesslistPage(),
      },
      // Change home to UserTypeSelectionPage
    );
  }
}
