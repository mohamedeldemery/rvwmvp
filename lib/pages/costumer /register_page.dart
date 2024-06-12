import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rvw/services/auth_service.dart';
import 'package:rvw/components/my_button.dart';
import 'package:rvw/components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  const RegisterPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  void _signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      if (passwordController.text == confirmPasswordController.text) {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        AuthService authService = AuthService();
        await authService.storeUserInFirestore(
          userCredential.user!,
          usernameController.text,
        );

        // Create user document
        createUserDocument(userCredential);

        // Navigate to another page or perform other actions after successful signup
      } else {
        _showErrorMessage("Passwords Don't Match!");
      }

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      _showErrorMessage(e.code);
    }
  }

  void _showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  Future<void> createUserDocument(UserCredential userCredential) async {
    if (userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .set({
        'email': userCredential.user!.email,
        'username': usernameController.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Set app bar background color to transparent
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 25),
                Image.asset(
                  'lib/images/rvwlogo.png',
                  height: 120,
                ),
                SizedBox(height: 25),
                Text(
                  'Create an Account!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                SizedBox(height: 10),
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
                SizedBox(height: 25),
                MyButton(
                  onTap: _signUserUp,
                  text: 'Sign Up',
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already Have an Account'),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Login Now!',
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// class MyTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final bool obscureText;
//
//   const MyTextField({
//     Key? key,
//     required this.controller,
//     required this.hintText,
//     this.obscureText = false,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         hintText: hintText,
//         border: OutlineInputBorder(),
//         contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//       ),
//     );
//   }
// }

// class MyButton extends StatelessWidget {
//   final VoidCallback onTap;
//   final String text;
//
//   const MyButton({
//     Key? key,
//     required this.onTap,
//     required this.text,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onTap,
//       child: Text(text),
//     );
//   }
// }
