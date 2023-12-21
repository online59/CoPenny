import 'package:flutter/material.dart';
import 'package:piggy/features/transaction/data/provider/transaction_provider.dart';
import 'package:piggy/features/transaction/presentation/screens/show_transaction_page.dart';
import 'package:provider/provider.dart';

class SpendingPage extends StatelessWidget {
  const SpendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransProvider(),
      child: const ShowTransactionPage(),
    );
  }
}
