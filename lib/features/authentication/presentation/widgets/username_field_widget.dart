import 'package:flutter/material.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:
          const InputDecoration(icon: Icon(Icons.person), hintText: 'Username'),
      onChanged: (value) => onChanged(value),
    );
  }
}
