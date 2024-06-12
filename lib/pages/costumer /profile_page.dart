import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 25),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color:  Colors.grey[800],
              //Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.all(25),
                    child: Icon(
                      Icons.person,
                      size: 64,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 25),
                  StreamBuilder<User?>(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      } else if (snapshot.data == null) {
                        return Center(
                          child: Text("User not authenticated"),
                        );
                      } else {
                        final User user = snapshot.data!;
                        return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                          future: FirebaseFirestore.instance
                              .collection("Users")
                              .doc(user.email)
                              .get(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              return Text("Error: ${snapshot.error}");
                            } else if (snapshot.hasData) {
                              final Map<String, dynamic>? userData = snapshot.data!.data();
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    " ${userData?['username'] ?? 'No username'}",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),

                                  Text(
                                    " ${userData?['email'] ?? 'No email'}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),


                                ],
                              );
                            } else {
                              return Center(
                                child: Text("No user data available"),
                              );
                            }
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
