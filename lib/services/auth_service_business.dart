import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServiceBusiness {
  Future<void> storeBusinessInFirestore(User user, String username, String email, String address, String contact, String category) async {
    try {
      // Reference to the Firestore collection
      final CollectionReference businessesCollection =
      FirebaseFirestore.instance.collection('businesses');

      // Add business data to Firestore
      await businessesCollection.doc(user.uid).set({
        'email': email,
        'username': username,
        'address': address,
        'contact': contact,
        'category': category,
        // Add more business data fields as needed
      });
    } catch (e) {
      // Handle errors if any
      print('Error storing business data: $e');
    }
  }

  Future<UserCredential?> BusinessRegister(
      {required String email,
        required String password,
        required String username,
        required String address,
        required String contact,
        required String category}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        // Store business data in Firestore
        await storeBusinessInFirestore(
            userCredential.user!, username, email, address, contact, category);

        return userCredential;
      }
    } catch (e) {
      print('Error registering business: $e');
      return null;
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
