import 'package:flutter/material.dart';

class CardWalletWidget extends StatelessWidget {
  const CardWalletWidget({super.key, required this.walletName, required this.walletId});

  final String walletName;
  final String walletId;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(walletName),
        subtitle: Text(walletId),
      ),
    );
  }
}
