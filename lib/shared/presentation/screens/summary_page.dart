import 'package:flutter/material.dart';
import 'package:piggy/features/wallet/data/provider/wallet_provider.dart';
import 'package:provider/provider.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WalletProvider>(
      builder: (_, provider, __) => const Center(
        child: Text("Summary Page"),
      ),
    );
  }
}
