import 'package:flutter/material.dart';
import '../../utils/image_builder.dart';

class HeroBackground extends StatelessWidget {
  final String imageUrl;
  final String heroTag;

  const HeroBackground({
    super.key,
    required this.imageUrl,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: SizedBox.expand(child: buildCharacterImage(imageUrl)),
    );
  }
}
