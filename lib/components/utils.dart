import 'dart:io'; // Import 'dart:io' for File class
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// Make sure to define the return type of the function
Future<List<int>?> pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();

  // Use 'imagePicker' instead of '_imagePicker'
  final XFile? file = await imagePicker.pickImage(source: source);

  // Check if 'file' is not null
  if (file != null) {
    // Use 'file' instead of '_file'
    return await File(file.path).readAsBytes();
  }

  // Print a message if no image is selected
  print('No Images Selected');
  return null; // Return null if no image is selected
}
