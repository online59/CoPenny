import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/constants/text_strings.dart';
import 'package:piggy/src/features/authentication/screens/forget_password/forget_password_options/forget_password_button_widget.dart';
import 'package:piggy/src/features/authentication/screens/forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';
import 'package:piggy/src/features/core/screen/bottom_nav/core_container_screen.dart';
import 'package:piggy/src/features/wallet/controller/provider/wallet_provider.dart';
import 'package:provider/provider.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: mFormHeight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: mEmail,
                hintText: mEmail,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: mVSpacingMedium,
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                labelText: mPassword,
                hintText: mPassword,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),
            const SizedBox(
              height: mFormHeight,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgetPasswordScreen.buildShowModalBottomSheet(context);
                },
                child: const Text(mForgetPassword),
              ),
            ),
            const SizedBox(
              height: mVSpacingSmall,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CoreContainerScreen(),
                    ),
                  );
                },
                child: Text(mSignIn.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
