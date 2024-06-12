import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;
  final double? iconSize; // Make iconSize nullable

  const SquareTile({
    Key? key,
    required this.imagePath,
    required this.onTap,
    this.iconSize, // Make iconSize optional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200],
        ),
        child: SizedBox(
          width: iconSize ?? 40, // Use a default value if iconSize is not provided
          height: iconSize ?? 40, // Use a default value if iconSize is not provided
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain, // Ensure the icon fits within the specified size
          ),
        ),
      ),
    );
  }
}
