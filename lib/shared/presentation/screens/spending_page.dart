import 'package:flutter/material.dart';
import 'package:piggy/features/transaction/data/provider/trans_repo_provider.dart';
import 'package:piggy/features/transaction/presentation/screens/show_transaction_page.dart';
import 'package:provider/provider.dart';

class SpendingPage extends StatelessWidget {
  const SpendingPage({super.key});

  final String walletId = "walletId";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Spending')),
      ),
      body: ChangeNotifierProvider(
        create: (context) => TransRepositoryProvider(),
        child: ShowTransactionPage(walletId: walletId),
      ),
    );
  }
}
