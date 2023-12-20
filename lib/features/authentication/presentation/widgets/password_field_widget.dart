import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const PasswordField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration:
          const InputDecoration(icon: Icon(Icons.lock), hintText: 'Password'),
      onChanged: (value) => onChanged(value),
    );
  }
}
