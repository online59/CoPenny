import 'package:flutter/material.dart';
import 'package:piggy/features/transaction/data/provider/transaction_provider.dart';
import 'package:piggy/features/transaction/presentation/screens/display_transaction_page.dart';
import 'package:piggy/features/wallet/presentation/screens/display_wallet_page.dart';
import 'package:provider/provider.dart';

import '../../../features/wallet/data/provider/wallet_provider.dart';

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
