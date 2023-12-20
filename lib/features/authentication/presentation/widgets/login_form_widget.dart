import 'package:flutter/material.dart';
import 'package:piggy/features/authentication/presentation/widgets/password_field_widget.dart';
import 'package:piggy/features/authentication/presentation/widgets/username_field_widget.dart';

import 'login_button_widget.dart';

class LoginForm extends StatelessWidget {
  final Key? formKey;

  const LoginForm({super.key, this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          UsernameField(onChanged: (String value) {  },),
          PasswordField(onChanged: (String value) {  },),
          const LoginButton(),
        ],
      ),
    );
  }
}
