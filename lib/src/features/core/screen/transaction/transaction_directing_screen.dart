import 'package:flutter/material.dart';
import 'package:piggy/src/features/transaction/controller/provider/transaction_provider.dart';
import 'package:piggy/src/features/core/screen/transaction/transaction_screen.dart';
import 'package:piggy/src/features/wallet/controller/provider/wallet_provider.dart';
import 'package:piggy/src/features/wallet/screen/wallet/display_wallet_page.dart';
import 'package:provider/provider.dart';

class TransactionDirectingScreen extends StatelessWidget {
  const TransactionDirectingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TransactionProvider>(
      create: (BuildContext context) => TransactionProvider(),
      child: Consumer<WalletProvider>(
        builder: (_, provider, __) {
          if (provider.currentWalletId.isEmpty) {
            return const WalletScreen();
          } else {
            return TransactionScreen(walletId: provider.currentWalletId);
          }
        },
      ),
    );
  }
}
