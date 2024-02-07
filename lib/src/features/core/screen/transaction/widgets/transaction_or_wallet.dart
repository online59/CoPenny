import 'package:flutter/material.dart';
import 'package:piggy/src/features/core/screen/transaction/transaction_screen.dart';
import 'package:piggy/src/features/wallet/controller/provider/wallet_provider.dart';
import 'package:piggy/src/features/wallet/screen/wallet/display_wallet_page.dart';
import 'package:provider/provider.dart';

class TransactionOrWalletScreen extends StatelessWidget {
  const TransactionOrWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WalletProvider>(builder: (BuildContext context, provider, Widget? child) {
      return routingScreen(provider);
    },
    );
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
