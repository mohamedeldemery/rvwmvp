import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'business_page.dart';
import 'login_or_reg_business.dart';

class BusinessAuth extends StatelessWidget {
  const BusinessAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Fetch business data from Firestore
            return FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection("businesses")
                  .doc(snapshot.data!.email)
                  .get(),
              builder: (context, futureSnapshot) {
                if (futureSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (futureSnapshot.hasError) {
                  return Center(child: Text("Error: ${futureSnapshot.error}"));
                }

                if (!futureSnapshot.hasData || !futureSnapshot.data!.exists) {
                  return const Center(child: Text("No data available"));
                }

                // Extract email from the fetched document
                String userEmail = futureSnapshot.data!['email'];

                return BusinessPage(
                  userEmail: userEmail,
                );
              },
            );
          } else {
            return const LoginOrRegBusiness();
          }
        },
      ),
    );
  }
}
