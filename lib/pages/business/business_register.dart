import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rvw/pages/business/business_page.dart';
import 'package:rvw/services/auth_service_business.dart';
import 'package:rvw/components/my_button.dart';
import 'package:rvw/components/my_textfield.dart';

class BusinessRegister extends StatefulWidget {
  final Function()? onTap;

  const BusinessRegister({Key? key, required this.onTap}) : super(key: key);

  @override
  State<BusinessRegister> createState() => _BusinessRegisterState();
}

class _BusinessRegisterState extends State<BusinessRegister> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController businessCategoryController = TextEditingController();
  final TextEditingController contactInfoController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  void _signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
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

        AuthServiceBusiness authServiceBusiness = AuthServiceBusiness();
        await authServiceBusiness.storeBusinessInFirestore(
          userCredential.user!,
          usernameController.text,
          emailController.text,
          addressController.text,
          contactInfoController.text,
          businessCategoryController.text,
        );

        // Create a document in Firestore named after the business' email
        await FirebaseFirestore.instance
            .collection("businesses")
            .doc(emailController.text) // Use the business email as the document ID
            .set({
          'email': emailController.text,
          'username': usernameController.text,
          'businessCategory': businessCategoryController.text,
          'contactInfo': contactInfoController.text,
          'address': addressController.text,
          'description': '', // Default value if not available
          'googleReviewLink': '', // Default value if not available
        });

        // Navigate to profile page and pass userEmail
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BusinessPage(
              userEmail: emailController.text,
            ),
          ),
        );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Set app bar background color to transparent
        elevation: 0, // Remove app bar shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
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
                const SizedBox(height: 1),
                Image.asset(
                  'lib/images/rvwlogo.png',
                  height: 100,
                ),
                const SizedBox(height: 50),
                Text(
                  'Create an Account!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: businessCategoryController,
                  hintText: 'Business Category',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: contactInfoController,
                  hintText: 'Contact Info (Phone Number)',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: addressController,
                  hintText: 'Address',
                  obscureText: false,
                ),
                const SizedBox(height: 25),
                MyButton(
                  onTap: _signUserUp,
                  text: 'Sign Up',
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already Have an Account'),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Login Now!',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline, // Underline the text
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
