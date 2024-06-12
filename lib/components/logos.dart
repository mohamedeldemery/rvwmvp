import 'package:flutter/material.dart';

class Logos extends StatelessWidget {
  final String? imageUrl;
  final Function()? onTap;
  final double? iconSize;

  const Logos({
    Key? key,
    this.imageUrl,
    this.onTap,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: iconSize ?? 128,
        height: iconSize ?? 128,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200],
          image: DecorationImage(
            image: imageUrl != null ? NetworkImage(imageUrl!) : AssetImage('assets/sample_image.png') as ImageProvider,
            fit: BoxFit.cover,
            onError: (exception, stackTrace) {
              // Handle image loading error if needed
            },
          ),
        ),
        clipBehavior: Clip.hardEdge, // Ensures the image is clipped to the rounded border
      ),
    );
  }
}
