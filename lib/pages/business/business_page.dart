import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'dart:html' as html; // Import with prefix for web

class BusinessPage extends StatefulWidget {
  final String userEmail;

  BusinessPage({required this.userEmail});

  @override
  _BusinessPageState createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  bool _isEditing = false;
  String? _imageUrl;
  double _averageRating = 0.0;

  late TextEditingController _usernameController;
  late TextEditingController _businessCategoryController;
  late TextEditingController _emailController;
  late TextEditingController _contactInfoController;
  late TextEditingController _addressController;
  late TextEditingController _descriptionController;
  late TextEditingController _googleReviewLinkController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _businessCategoryController = TextEditingController();
    _emailController = TextEditingController();
    _contactInfoController = TextEditingController();
    _addressController = TextEditingController();
    _descriptionController = TextEditingController();
    _googleReviewLinkController = TextEditingController();
    _loadProfileData();
    _loadRatings();
    FirebaseStorage.instance.setMaxOperationRetryTime(Duration(minutes: 10)); // Increase retry time
  }

  Future<void> _loadProfileData() async {
    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('businesses')
          .doc(widget.userEmail)
          .get();

      if (docSnapshot.exists) {
        final userData = docSnapshot.data()!;
        setState(() {
          _usernameController.text = userData['username'] ?? '';
          _businessCategoryController.text = userData['business_category'] ?? '';
          _emailController.text = userData['email'] ?? '';
          _contactInfoController.text = userData['contact_info'] ?? '';
          _addressController.text = userData['address'] ?? '';
          _descriptionController.text = userData['description'] ?? '';
          _googleReviewLinkController.text = userData['google_review_link'] ?? '';
          _imageUrl = userData['imageUrl'] ?? '';
        });
      }
    } catch (e) {
      print('Error loading profile data: $e');
    }
  }

  Future<void> _loadRatings() async {
    try {
      final ratingsSnapshot = await FirebaseFirestore.instance
          .collection("businesses")
          .doc(widget.userEmail)
          .collection('ratings')
          .get();

      if (!mounted) return;  // Check if the widget is still mounted

      if (ratingsSnapshot.docs.isNotEmpty) {
        final List<double> ratings = ratingsSnapshot.docs.map((doc) => (doc['rating'] as num).toDouble()).toList();
        double totalRating = ratings.fold(0, (previous, current) => previous + current);
        if (mounted) {
          setState(() {
            _averageRating = totalRating / ratings.length;
          });
        }
      }
    } catch (e) {
      print('Error loading ratings: $e');
    }
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed('/login');
  }

  Future<void> selectImage() async {
    try {
      final Uint8List? imageBytes = await pickImage();

      if (imageBytes != null) {
        String? uploadedImageUrl;

        if (kIsWeb) {
          // Handle image upload for web
          final html.Blob blob = html.Blob([imageBytes]);
          final html.File file = html.File([blob], 'profile_image.jpg');
          uploadedImageUrl = await _uploadImageWeb(file);
        } else {
          // Handle image upload for mobile
          final io.Directory tempDir = await getTemporaryDirectory();
          final io.File file = await io.File('${tempDir.path}/profile_image.jpg').writeAsBytes(imageBytes);
          uploadedImageUrl = await _uploadImage(file);
        }

        if (uploadedImageUrl != null) {
          print('Uploaded image URL: $uploadedImageUrl');
          if (mounted) {
            setState(() {
              _imageUrl = uploadedImageUrl;
            });
          }

          // Update Firestore with the new image URL
          await FirebaseFirestore.instance
              .collection('businesses')
              .doc(widget.userEmail)
              .update({'imageUrl': _imageUrl});

          print('Image URL updated in Firestore: $_imageUrl');
        } else {
          print('Error: Uploaded image URL is null');
        }
      }
    } catch (e) {
      print('Error selecting image: $e');
    }
  }

  Future<Uint8List?> pickImage() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      return await file.readAsBytes();
    }

    print('No Images Selected');
    return null;
  }

  Future<String?> _uploadImageWeb(html.File imageFile) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        print('Error: User not authenticated');
        return null;
      }

      String fileName = 'profile_images/${user.email}.jpg';
      Reference storageReference = FirebaseStorage.instance.ref().child(fileName);
      UploadTask uploadTask = storageReference.putBlob(imageFile);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      print('Image uploaded to Firebase Storage (Web): $downloadURL');
      return downloadURL;
    } catch (e) {
      print('Error uploading image (Web): $e');
      return null;
    }
  }

  Future<String?> _uploadImage(io.File imageFile) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        print('Error: User not authenticated');
        return null;
      }

      String fileName = 'profile_images/${user.email}.jpg';
      Reference storageReference = FirebaseStorage.instance.ref().child(fileName);
      UploadTask uploadTask = storageReference.putFile(imageFile);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadURL = await taskSnapshot.ref.getDownloadURL();
      print('Image uploaded to Firebase Storage (Mobile): $downloadURL');
      return downloadURL;
    } catch (e) {
      print('Error uploading image (Mobile): $e');
      return null;
    }
  }

  Future<void> _updateProfile() async {
    try {
      await FirebaseFirestore.instance
          .collection('businesses')
          .doc(widget.userEmail)
          .update({
        'username': _usernameController.text,
        'business_category': _businessCategoryController.text,
        'contact_info': _contactInfoController.text,
        'address': _addressController.text,
        'description': _descriptionController.text,
        'google_review_link': _googleReviewLinkController.text,
        'imageUrl': _imageUrl,  // Ensure the image URL is also updated
      });
      if (mounted) {
        print('Profile updated in Firestore');
      }
    } catch (e) {
      print('Error updating profile: $e');
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _businessCategoryController.dispose();
    _emailController.dispose();
    _contactInfoController.dispose();
    _addressController.dispose();
    _descriptionController.dispose();
    _googleReviewLinkController.dispose();
    super.dispose();
  }

  void _navigateToEditPage(String title, String currentValue, TextEditingController controller, {bool isDescription = false}) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => EditFieldPage(
        title: title,
        currentValue: currentValue,
        controller: controller,
        onSave: _updateProfile,
        isDescription: isDescription,
      ),
    ));
  }

  void _navigateToRatingPage() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => RatingPage(averageRating: _averageRating),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundColor: Colors.grey,
                    child: _imageUrl != null
                        ? ClipOval(
                      child: Image.network(
                        _imageUrl!,
                        width: 128,
                        height: 128,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 64,
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                    )
                        : const Icon(
                      Icons.person,
                      size: 64,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(Icons.add_a_photo),
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _usernameController.text,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => _navigateToEditPage('Username', _usernameController.text, _usernameController),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                _businessCategoryController.text,
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 5,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    _buildClickableContainer('Email', _emailController.text, _emailController, icon: Icons.email),
                    _buildClickableContainer('Contact Info', _contactInfoController.text, _contactInfoController, icon: Icons.phone),
                    _buildClickableContainer('Address', _addressController.text, _addressController, icon: Icons.location_on),
                    _buildClickableContainer('Description', _descriptionController.text, _descriptionController, icon: Icons.description, isDescription: true),
                    _buildClickableContainer('Google Review Link', _googleReviewLinkController.text, _googleReviewLinkController, icon: Icons.link),
                    GestureDetector(
                      onTap: _navigateToRatingPage,
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.star, color: Colors.black),
                                SizedBox(width: 4),
                                Text('Average Rating'),
                              ],
                            ),
                            Text(_averageRating.toStringAsFixed(1)),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: _signOut,
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(Icons.logout, color: Colors.black),
                                SizedBox(width: 4),
                                Text('Log Out'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClickableContainer(String title, String currentValue, TextEditingController controller, {bool isDescription = false, IconData? icon}) {
    return GestureDetector(
      onTap: () => _navigateToEditPage(title, currentValue, controller, isDescription: isDescription),
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (icon != null) Icon(icon, color: Colors.black),
                const SizedBox(width: 8),
                Text(title),
              ],
            ),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}

class EditFieldPage extends StatelessWidget {
  final String title;
  final String currentValue;
  final TextEditingController controller;
  final VoidCallback onSave;
  final bool isDescription;

  const EditFieldPage({
    Key? key,
    required this.title,
    required this.currentValue,
    required this.controller,
    required this.onSave,
    this.isDescription = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.text = currentValue;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit $title'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            isDescription
                ? Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(labelText: title),
                maxLines: null, // Allow unlimited lines
                expands: true, // Expand to fill available space
              ),
            )
                : TextField(
              controller: controller,
              decoration: InputDecoration(labelText: title),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                onSave();
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingPage extends StatelessWidget {
  final double averageRating;

  const RatingPage({Key? key, required this.averageRating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Average Rating'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Text(
          'Average Rating: ${averageRating.toStringAsFixed(1)}',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
