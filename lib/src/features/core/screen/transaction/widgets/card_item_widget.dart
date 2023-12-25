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

  static const Color borderColor = Color(0xFFF5F5F5);

  @override
  Widget build(BuildContext context) {
    return itemContainer();
  }

  Widget itemContainer() => Container(
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: borderColor,
        )
      )
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
            title: Text(content),
            leading: circleAvatar,
            trailing: Text(
              amount,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
    ),
  );
}
