import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget(
      {super.key,
      this.imageColor,
      this.imageHeight = 0.2,
      this.heightBetween,
      required this.imagePath,
      required this.title,
      required this.subTitle,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.textAlign});

  final Color? imageColor;
  final double imageHeight;
  final double? heightBetween;
  final String imagePath, title, subTitle;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Image(
            image: AssetImage(imagePath),
            height: size.height * 0.3,
          ),
          SizedBox(
            height: heightBetween,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
