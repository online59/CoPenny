import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piggy/src/constants/sizes.dart';

class TextGradientOpacWidget extends StatelessWidget {
  const TextGradientOpacWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black.withOpacity(0.7),
            Colors.transparent
          ],
        ),
        borderRadius:
        BorderRadius.circular(mContainerMediumRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(mPaddingSmall),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}