import 'package:flutter/material.dart';
import 'package:piggy/features/transaction/data/provider/trans_repo_provider.dart';
import 'package:piggy/features/transaction/domain/models/transaction_header_model.dart';
import 'package:piggy/features/transaction/presentation/screens/show_transaction_page.dart';
import 'package:piggy/routes/router_navigator.dart';
import 'package:piggy/routes/routes.dart';
import 'package:provider/provider.dart';

class SpendingPage extends StatelessWidget {
  const SpendingPage({super.key});

  final String walletId = "walletId";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Spending')),
        actions: [
          IconButton(
            onPressed: () {
              RouterNavigator.generateRoute(
                const RouteSettings(name: myWalletPageRoute),
              );
            },
            icon: const Icon(Icons.wallet),
          )
        ],
      ),
      body: FutureProvider<List<TransHeaderModel>>(
        create: (context) => TransRepositoryProvider().getTransaction(walletId),
        initialData: const <TransHeaderModel>[],
        child: const ShowTransactionPage(),
      ),
    );
  }
}
