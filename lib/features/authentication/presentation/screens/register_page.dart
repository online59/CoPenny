import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../shared/presentation/widgets/my_button.dart';
import '../../../../shared/presentation/widgets/my_textfield.dart';
import '../../../../shared/presentation/widgets/square_tile.dart';
import '../../application/controller/auth_controller.dart';
import '../../application/services/email_auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _authController = AuthController();

  final RegExp _passwordPattern =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  bool _isPasswordValid = true;

  void _checkPassword() {
    setState(() {
      _isPasswordValid = _passwordPattern.hasMatch(_passwordController.text);
    });
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

  void signUserUp() async {
    //show loading circle
    _pushLoadingCircle();

    //check password validity
    _checkPassword();

    if (!_isPasswordValid) {
      _popLoadingCircle();
      _genericErrorMessage(
          "Please make sure your password contains special characters.");
      return;
    }

    try {
      // check if both password and confirm password is the same
      if (_passwordController.text == _confirmPasswordController.text) {
        await _authController.register(
            EmailAuthService(_emailController.text, _passwordController.text));
      } else {
        // show error password don't match
        _genericErrorMessage('Password don\'t match!');
      }

      // pop the loading circle
      _popLoadingCircle();
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      _popLoadingCircle();

      _genericErrorMessage(e.code);
    }
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
                const SizedBox(height: 50),
                //logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(height: 10),
                //welcome back you been missed

                const SizedBox(height: 25),

                //username
                MyTextField(
                  controller: _emailController,
                  hintText: 'Username or email',
                  obscureText: false,
                ),

                const SizedBox(height: 15),
                //password
                MyTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 15),

                MyTextField(
                  controller: _confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
                const SizedBox(height: 15),

                //sign in button
                MyButton(
                  onTap: () => signUserUp(),
                  text: 'Sign Up',
                ),
                const SizedBox(height: 20),

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
                const SizedBox(height: 60),

                // not a member ? register now

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Login now',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
