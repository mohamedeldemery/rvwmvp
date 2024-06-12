import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  Future<void> storeUserInFirestore(User user, String username) async {
    try {
      // Reference to the Firestore collection
      final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

      // Add user data to Firestore
      await usersCollection.doc(user.uid).set({
        'email': user.email,
        'username': username, // Store the username in Firestore
        // Add more user data fields as needed
      });
    } catch (e) {
      // Handle errors if any
      print('Error storing user data: $e');
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      if (gUser == null) {
        return null; // User canceled sign-in
      }

      final GoogleSignInAuthentication gAuth = await gUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print('Error signing in with Google: $e');
      return null;
    }
  }
}
