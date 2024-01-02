import 'package:flutter/material.dart';

class TransactionHeaderWidget extends StatelessWidget {
  const TransactionHeaderWidget({super.key, required this.header, required this.totalAmount});

  final String header;
  final String totalAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      color: Theme.of(context).colorScheme.inversePrimary,
      child: Row(
        children: [
          Expanded(
            child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(padding: const EdgeInsets.only(left: 24),
                child: Text(header))),
          ),

          Expanded(
            child: Align(
                alignment: Alignment.centerRight,
                child: Padding(padding: const EdgeInsets.only(right: 24),
                    child: Text(totalAmount))),
          ),
        ],
      ),
    );
  }
}
