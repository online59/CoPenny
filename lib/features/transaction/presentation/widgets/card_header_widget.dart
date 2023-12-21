import 'package:flutter/material.dart';

class CardHeaderWidget extends StatelessWidget {
  const CardHeaderWidget({super.key, required this.header});

  final String header;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(header),
        Divider(
          color: Colors.grey[300],
        )
      ],
    );
  }
}
