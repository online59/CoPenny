import 'package:flutter/material.dart';
import 'package:piggy/src/constants/sizes.dart';

class TransactionItemWidget extends StatelessWidget {
  const TransactionItemWidget({
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(mContainerMediumRadius),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: ListTile(
            title: Text(content),
            leading: circleAvatar,
            trailing: Text(
              amount,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );
  }
}
