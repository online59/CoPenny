import 'package:flutter/material.dart';
import 'package:piggy/constants/image_strings.dart';
import 'package:piggy/constants/text_strings.dart';


class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: const AssetImage(mWelcomeScreenImage),
          height: size.height * 0.3,
        ),
        Text(
          mWelcomeTitle,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          mWelcomeSubtitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
