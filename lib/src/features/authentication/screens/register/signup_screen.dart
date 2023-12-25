import 'package:flutter/material.dart';
import 'package:piggy/src/common_widget/forms/form_header_widget.dart';
import 'package:piggy/src/constants/image_strings.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(mDefaultSize),
            child: Column(
              children: [
                const FormHeaderWidget(
                  imagePath: mWelcomeScreenImage,
                  title: mSignUpTitle,
                  subTitle: mSignUpSupTitle,
                ),
                Container(
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
                              Icons.person_outline_rounded,
                            ),
                          ),
                        ),
                        const SizedBox(height: mVSpacingSmall,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
