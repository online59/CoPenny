import 'package:flutter/material.dart';

class CardItemWidget extends StatelessWidget {
  const CardItemWidget({
    super.key,
    required this.circleAvatar,
    required this.content,
    required this.amount,
  });

  final CircleAvatar circleAvatar;
  final String content;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        itemContainer(),
        Divider(
          color: Colors.grey[100],
        )
      ],
    );
  }

  Widget itemContainer() => ListTile(
    title: Text(content),
    leading: circleAvatar,
    trailing: Text(amount),
  );
}
