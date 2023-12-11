import 'package:flutter/material.dart';
import 'package:piggy/features/transaction/presentation/screens/transaction_item_container.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: TransactionContainer(),
        ),
      ],
    );
  }
}
