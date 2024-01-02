import 'package:flutter/material.dart';
import 'package:piggy/src/features/core/screen/transaction/transaction_screen.dart';
import 'package:piggy/src/features/wallet/controller/provider/wallet_provider.dart';
import 'package:piggy/src/features/wallet/screen/wallet/display_wallet_page.dart';

class TransactionOrWalletScreen extends StatelessWidget {
  const TransactionOrWalletScreen({super.key, required this.walletProvider});

  final WalletProvider walletProvider;

  @override
  Widget build(BuildContext context) {
    return routingScreen(walletProvider);
  }

  Widget routingScreen(WalletProvider provider) {
    if (provider.hasError) {
      return const Center(child: Text("Cannot load data!"));
    } else if (provider.currentWalletId.isEmpty) {
      return const WalletScreen();
    } else if (provider.hasData) {
      return const TransactionScreen();
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
