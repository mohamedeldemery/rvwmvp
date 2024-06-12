import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {

  const MyDrawer ({Key? key});

  void logout(){
     FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
        //Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
            child: Icon(
              Icons.face,
              size: 40,

              color:  Colors.black,
              //Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          SizedBox(height: 25), // Corrected SizedBox usage

          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.black,
              //Theme.of(context).colorScheme.inversePrimary,
            ),
            title: Text("HOME"),
            onTap: () {
              Navigator.pop(context);
            },
          ), // Removed padding and adjusted ListTile

          ListTile(
            leading: Icon(
              Icons.person,
              color:  Colors.black,
              //Theme.of(context).colorScheme.inversePrimary,
            ),
            title: Text("PROFILE"),
            onTap: () {
              Navigator.pop(context);

              Navigator.pushNamed(context, '/profile_page');
            },
          ), // Removed padding and adjusted ListTile

          // ListTile(
          //   leading: Icon(
          //     Icons.group,
          //     color: Theme.of(context).colorScheme.inversePrimary,
          //   ),
            // title: Text("USERS"),
            // onTap: () {
            //   Navigator.pop(context);
            //
            //   Navigator.pushNamed(context, '/users_page');
            // },
          // ), // Removed padding and adjusted ListTile

          Expanded(child: SizedBox()), // Added to push logout ListTile to the bottom

          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color:   Colors.black,
              //Theme.of(context).colorScheme.inversePrimary,
            ),
            title: Text("LOGOUT"),
            onTap: () {
              Navigator.pop(context);

              logout();
            },
          ), // Removed padding and adjusted ListTile
        ],
      ),
    );
  }
}
