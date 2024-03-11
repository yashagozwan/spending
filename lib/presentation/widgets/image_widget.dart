import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ImageWidget extends StatelessWidget {
  final String url;
  final double size;

  const ImageWidget({
    super.key,
    required this.url,
    this.size = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      alignment: Alignment.center,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Image.network(
        url,
        errorBuilder: (context, error, stackTrace) {
          return const FaIcon(
            FontAwesomeIcons.solidImage,
          );
        },
      ),
    );
  }
}
