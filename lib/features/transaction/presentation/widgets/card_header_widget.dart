import 'package:flutter/material.dart';

class CardHeaderWidget extends StatelessWidget {
  const CardHeaderWidget({super.key, required this.header});

  final String header;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      color: Theme.of(context).colorScheme.inversePrimary,
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(header)),
    );
  }
}
