import 'package:flutter/material.dart';
import 'package:piggy/src/constants/sizes.dart';
import 'package:piggy/src/features/core/screen/transaction/model/transaction_item_model.dart';

class EachTransactionWidget extends StatelessWidget {
  const EachTransactionWidget({
    super.key,
    required this.circleAvatar, required this.transactionItem,
  });

  final CircleAvatar circleAvatar;
  final TransItemModel transactionItem;

  static const Color borderColor = Color(0xFFF5F5F5);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(transactionItem.content),
            duration: const Duration(seconds: 1),
          ),
        );
      },
      child: Padding(
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
              title: Text(transactionItem.content),
              leading: circleAvatar,
              trailing: Text(
                transactionItem.amount.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
