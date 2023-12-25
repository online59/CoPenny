import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:piggy/src/common_widget/forms/form_header_widget.dart';
import 'package:piggy/src/constants/image_strings.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/constants/text_strings.dart';
import 'package:piggy/src/features/authentication/controller/provider/auth_controller.dart';
import 'package:piggy/src/features/authentication/controller/services/firebase_auth_service.dart';
import 'package:piggy/src/features/authentication/controller/services/google_auth_service.dart';
import 'package:piggy/src/features/authentication/screens/login/widgets/login_footer_widget.dart';
import 'package:piggy/src/features/authentication/screens/login/widgets/login_form_widget.dart';
import 'package:piggy/src/features/core/screen/bottom_nav/bottom_navigation_container.dart';

import 'widgets/login_header_widget.dart';

class LoginScreen extends StatefulWidget {
  final Function()? onTap;

  const LoginScreen({super.key, this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _authController = AuthController();

  void _signUserInWithEmailPassword() async {
    //show loading circle while sign in
    _pushLoadingCircle();

    try {
      await _authController
          .signIn(FirebaseAuthService(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
              isAnonymous: false))
          .whenComplete(() {
        //pop loading circle when complete
        _popLoadingCircle();
        _pushNamed(HomePage());
      });
    } on FirebaseAuthException catch (e) {
      _genericErrorMessage(e.message ?? e.code);
    }
  }

  void _signUserInWithGmail() async {
    //show loading circle while sign in
    _pushLoadingCircle();

    try {
      await _authController.signIn(GoogleAuthService()).whenComplete(() {
        //pop loading circle when complete
        _popLoadingCircle();
        _pushNamed(HomePage());
      });
    } on FirebaseAuthException catch (e) {
      _genericErrorMessage(e.message ?? e.code);
    }
  }

  void _signUserInAnonymous() async {
    //show loading circle while sign in
    _pushLoadingCircle();

    try {
      await _authController
          .signIn(FirebaseAuthService(isAnonymous: true))
          .whenComplete(() {
        //pop loading circle when complete
        _popLoadingCircle();
        _pushNamed(HomePage());
      });
    } on FirebaseAuthException catch (e) {
      _genericErrorMessage(e.message ?? e.code);
    }
  }

  void _pushLoadingCircle() {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  //pop loading circle
  void _popLoadingCircle() {
    Navigator.pop(context);
  }

  //routing
  void _pushNamed(Widget route) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => route));
  }

  void _genericErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              message,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              )
            ],
          );
        });
  }

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
