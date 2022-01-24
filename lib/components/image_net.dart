import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageNet extends StatelessWidget {
  const ImageNet({Key? key, required this.size, required this.urlAvatar})
      : super(key: key);

  final double size;
  final String urlAvatar;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CachedNetworkImage(
        imageUrl: urlAvatar,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size / 2),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(
          Icons.error,
          color: Colors.grey,
          size: size / 2,
        ),
      ),
    );
  }
}
