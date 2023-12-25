import 'package:flutter/material.dart';
import 'package:piggy/src/constants/image_strings.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/constants/text_strings.dart';


class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('OR'),
        const SizedBox(height: mVSpacingSmall,),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Image(
                image: AssetImage(mGoogleLogoImage),
                width: mButtonLogoSize,
              ),
              label: const Text(mSignInWithGoogle)),
        ),
        const SizedBox(height: mVSpacingSmall,),
        TextButton(
          onPressed: () {},
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: "$mAlreadyHaveAccount ",
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: mSignIn.toUpperCase(),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}