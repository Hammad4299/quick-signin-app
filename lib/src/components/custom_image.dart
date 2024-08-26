import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imageAsset;
  final double width;
  final double height;

  const CustomImage({
    super.key,
    required this.imageAsset,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(imageAsset),
      width: width,
      height: height,
      fit: BoxFit.fill,
    );
  }

}