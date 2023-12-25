import 'package:flutter/material.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/constants/text_strings.dart';


class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(vertical: mVSpacingMedium),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text(mFullName),
                prefixIcon: Icon(
                  Icons.person_outline_rounded,
                ),
              ),
            ),
            const SizedBox(
              height: mVSpacingSmall,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(mEmail),
                prefixIcon: Icon(
                  Icons.email_outlined,
                ),
              ),
            ),
            const SizedBox(height: mVSpacingSmall,),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(mPhoneNumber),
                prefixIcon: Icon(
                  Icons.phone_android_outlined,
                ),
              ),
            ),
            const SizedBox(height: mVSpacingSmall,),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(mPassword),
                prefixIcon: Icon(
                  Icons.lock_outline,
                ),
              ),
            ),
            const SizedBox(height: mVSpacingMedium,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(mSignUp.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
