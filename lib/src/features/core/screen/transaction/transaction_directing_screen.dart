import 'package:flutter/material.dart';
import 'package:piggy/src/features/transaction/controller/provider/transaction_provider.dart';
import 'package:piggy/src/features/core/screen/transaction/transaction_screen.dart';
import 'package:piggy/src/features/wallet/controller/provider/wallet_provider.dart';
import 'package:piggy/src/features/wallet/screen/wallet/display_wallet_page.dart';
import 'package:provider/provider.dart';

class TransactionDirectingScreen extends StatelessWidget {
  const TransactionDirectingScreen({super.key, required this.walletProvider});

  final WalletProvider walletProvider;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TransactionProvider>(
      create: (BuildContext context) => TransactionProvider(),
      child: reroutingScreen(walletProvider),
    );
  }

  Widget reroutingScreen(WalletProvider provider) {
    if (provider.hasError) {
      return const Center(child: Text("Cannot load data!"));
    } else if (provider.currentWalletId.isEmpty) {
      return const WalletScreen();
    } else if (provider.hasData) {
      return TransactionScreen(walletId: provider.currentWalletId);
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
