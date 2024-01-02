import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:piggy/src/common_widget/forms/form_header_widget.dart';
import 'package:piggy/src/constants/image_strings.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/constants/text_strings.dart';
import 'package:piggy/src/features/authentication/screens/login/widgets/login_footer_widget.dart';
import 'package:piggy/src/features/authentication/screens/login/widgets/login_form_widget.dart';

class LoginScreen extends StatefulWidget {
  final Function()? onTap;

  const LoginScreen({super.key, this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    //get device's height
    var mediaQuery = MediaQuery.of(context);
    var size = mediaQuery.size;
    var brightness = mediaQuery.platformBrightness;
    var isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      resizeToAvoidBottomInset: true,
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(mDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormHeaderWidget(
                  imagePath: mWelcomeScreenImage,
                  title: mWelcomeTitle,
                  subTitle: mWelcomeSubtitle,
                  heightBetween: mVSpacingSmall),
              LoginFormWidget(),
              LoginFooterWidget()
            ],
          ),
        ),
      ),
    );
  }
}
