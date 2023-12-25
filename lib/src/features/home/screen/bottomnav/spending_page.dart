import 'package:flutter/material.dart';
import 'package:piggy/src/features/transaction/controller/provider/transaction_provider.dart';
import 'package:piggy/src/features/transaction/presentation/display_transaction/display_transaction_page.dart';
import 'package:piggy/src/features/wallet/controller/provider/wallet_provider.dart';
import 'package:piggy/src/features/wallet/screen/wallet/display_wallet_page.dart';
import 'package:provider/provider.dart';

class SpendingPage extends StatelessWidget {
  const SpendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TransactionProvider>(
      create: (BuildContext context) => TransactionProvider(),
      child: Consumer<WalletProvider>(
          builder: (_, provider, __) => showWalletOrSpending(provider.currentWalletId)),
    );
  }

  Widget showWalletOrSpending(String walletId) {
    if (walletId.isEmpty) {
      return const DisplayWalletPage();
    } else {
      return DisplayTransactionPage(walletId: walletId);
    }
  }
}
