import 'package:flutter/material.dart';
import 'package:piggy/src/common_widget/forms/form_header_widget.dart';
import 'package:piggy/src/constants/image_strings.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/constants/text_strings.dart';
import 'package:piggy/src/features/authentication/screens/register/widgets/signup_footer_widget.dart';
import 'package:piggy/src/features/authentication/screens/register/widgets/signup_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(mDefaultSize),
            child: const Column(
              children: [
                FormHeaderWidget(
                  imagePath: mWelcomeScreenImage,
                  title: mSignUpTitle,
                  subTitle: mSignUpSupTitle,
                ),
                SignUpFormWidget(),
                SignUpFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
