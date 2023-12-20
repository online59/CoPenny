import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../routes/routes.dart';
import '../../../../shared/presentation/widgets/my_button.dart';
import '../../../../shared/presentation/widgets/my_textfield.dart';
import '../../application/provider/auth_controller.dart';
import '../../application/services/anonym_auth_service.dart';
import '../../application/services/email_auth_service.dart';
import '../../application/services/google_auth_service.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _signInWithEmail = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _authController = AuthController();

  void _signUserInWithEmailPassword() async {
    //show loading circle while sign in
    _pushLoadingCircle();

    try {
      await _authController
          .signIn(
              EmailAuthService(_emailController.text, _passwordController.text))
          .whenComplete(() {
        //pop loading circle when complete
        _popLoadingCircle();
        _pushNamed(homePageRoute);
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
        _pushNamed(homePageRoute);
      });
    } on FirebaseAuthException catch (e) {
      _genericErrorMessage(e.message ?? e.code);
    }
  }

  void _signUserInAnonymous() async {
    //show loading circle while sign in
    _pushLoadingCircle();

    try {
      await _authController.signIn(AnonymousAuthService()).whenComplete(() {
        //pop loading circle when complete
        _popLoadingCircle();
        _pushNamed(homePageRoute);
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
  void _pushNamed(String route) {
    Navigator.of(context).pushNamed(route);
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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                // logo
                const Icon(
                  Icons.lock_person,
                  size: 150,
                ),
                const SizedBox(
                  height: 10,
                ),
                // welcome back you been missed

                Text(
                  'Welcome back you\'ve been missed',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),

                // username
                MyTextField(
                  controller: _emailController,
                  hintText: 'Username or email',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 15,
                ),

                // password
                MyTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 15,
                ),

                // sign in button
                MyButton(
                  onTap: () {
                    _signInWithEmail = true;
                    _signUserInWithEmailPassword();
                  },
                  text: 'Sign In',
                ),
                const SizedBox(
                  height: 20,
                ),

                // forgot password

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Forgot your login details? ',
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 12),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Get help logging in.',
                        style: TextStyle(
                          color: Colors.blue.shade900,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                // continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Text(
                          'OR',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                // google + apple button

                MyButton(
                  onTap: () {
                    _signInWithEmail = false;
                    _signUserInAnonymous();
                  },
                  text: 'Sign In With Google',
                  color: Colors.pinkAccent[400],
                ),

                const SizedBox(
                  height: 80,
                ),

                // not a member? register now

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member? ',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Register now',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
