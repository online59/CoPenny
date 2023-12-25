import 'package:flutter/material.dart';
import 'package:piggy/src/constants/image_strings.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/constants/text_strings.dart';


class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('OR'),
        const SizedBox(
          height: mFormHeight,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(mGoogleLogoImage),
              width: mButtonLogoHeight,
              height: mButtonLogoHeight,
            ),
            label: Text(mSignInWithGoogle.toUpperCase()),
          ),
        ),
        const SizedBox(
          height: mFormHeight - 10,
        ),
        TextButton(
          onPressed: () {},
          child: Text.rich(
            TextSpan(
              text: "$mDontHaveAccount ",
              style: Theme.of(context).textTheme.bodySmall,
              children: const [
                TextSpan(
                  text: mSignUp,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}