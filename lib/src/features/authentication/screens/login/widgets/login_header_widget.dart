import 'package:flutter/material.dart';
import 'package:piggy/src/constants/image_strings.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/constants/text_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: const AssetImage(mWelcomeScreenImage),
            height: size.height * 0.3,
          ),
          const SizedBox(
            height: mVSpacingSmall,
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
      ),
    );
  }
}
