import 'package:flutter/material.dart';

class TransactionListBuilder extends StatelessWidget {
  const TransactionListBuilder({
    super.key,
    required this.transactionItems,
  });

  final List<Map<String, dynamic>> transactionItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: transactionItems.map<Widget>((expense) {
        return ListTile(
          leading: CircleAvatar(
            child: Text(
              expense['name'][0],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          title: Row(
            children: [
              Text(expense['name']),
              const Spacer(),
              Text(expense['value']),
            ],
          ),
          // You can add more details to each expense if needed
        );
      }).toList(),
    );
  }
}