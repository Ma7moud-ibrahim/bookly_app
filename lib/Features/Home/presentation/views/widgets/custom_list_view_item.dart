import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage(this.imageUrl, {super.key});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final secureImageUrl = imageUrl.startsWith('http://')
        ? imageUrl.replaceFirst('http://', 'https://')
        : imageUrl;

    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: secureImageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(color: Colors.grey.shade800),
          errorWidget: (context, url, error) => Container(
            color: Colors.grey.shade800,
            child: const Icon(Icons.broken_image, color: Colors.white54),
          ),
        ),
      ),
    );
  }
}
