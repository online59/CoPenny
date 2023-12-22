import 'package:flutter/material.dart';
import 'package:piggy/features/transaction/data/provider/trans_repo_provider.dart';
import 'package:piggy/features/transaction/domain/models/transaction_header_model.dart';
import 'package:piggy/features/transaction/presentation/screens/display_transaction_page.dart';
import 'package:piggy/features/wallet/presentation/screens/display_wallet_page.dart';
import 'package:provider/provider.dart';

import '../../../features/wallet/data/provider/wallet_repo_provider.dart';
import '../../../features/wallet/domain/model/wallet_model.dart';

class SpendingPage extends StatelessWidget {
  const SpendingPage({super.key, required this.walletId});

  final String walletId;

  @override
  Widget build(BuildContext context) {
    return showWalletOrSpending();
  }

  Widget showWalletOrSpending() {
    if (walletId.isEmpty) {
      return FutureProvider(
        create: (BuildContext context) => WalletRepositoryProvider().getAll(),
        initialData: const <WalletModel>[],
        child: const DisplayWalletPage(),
      );
    } else {
      return FutureProvider<List<TransHeaderModel>>(
        create: (context) => TransRepositoryProvider().getTransaction(walletId),
        initialData: const <TransHeaderModel>[],
        child: const DisplayTransactionPage(),
      );
    }
  }
}
