import 'package:flutter/material.dart';

Widget networkImageWithFallback(
    String url, {
      required String fallbackAssetPath,
      double? width,
      double? height,
      BoxFit? fit,
      double borderRadius = 0, // Default border radius
    }) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(borderRadius),
    child: Image.network(
      url,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (_, __, ___) => ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image.asset(
          fallbackAssetPath,
          width: width,
          height: height,
          fit: fit,
        ),
      ),
    ),
  );
}
