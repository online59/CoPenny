import 'package:flutter/material.dart';

Widget networkImageWithFallback(
    String url, {
      required String fallbackAssetPath,
      double? width,
      double? height,
      BoxFit? fit,
    }) {
  return Image.network(
    url,
    width: width,
    height: height,
    fit: fit,
    errorBuilder: (_, __, ___) => Image.asset(
      fallbackAssetPath,
      width: width,
      height: height,
      fit: fit,
    ),
  );
}