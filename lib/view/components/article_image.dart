import 'package:flutter/material.dart';

import '../../app/utils/values_managers/assets_manager.dart';

class ArticleImage extends StatelessWidget {
  const ArticleImage({
    super.key,
    required this.imageUrl,
  });
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return (imageUrl != null && imageUrl!.isNotEmpty)
        ? Image.network(
            imageUrl!,
            errorBuilder: (context, error, stackTrace) => Image.asset(
              ImagesManager.fallbackImage,
              fit: BoxFit.fill,
            ),
            fit: BoxFit.fill,
          )
        : Image.asset(
            ImagesManager.fallbackImage,
            fit: BoxFit.fill,
          );
  }
}
