import 'package:flutter/material.dart';
import 'package:piggy/features/wallet/data/provider/wallet_repo_provider.dart';
import 'package:piggy/features/wallet/domain/model/wallet_model.dart';
import 'package:piggy/features/wallet/presentation/widgets/card_wallet_widget.dart';
import 'package:provider/provider.dart';

class MyWalletPage extends StatelessWidget {
  const MyWalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<WalletModel>>(
      create: (BuildContext context) => WalletRepositoryProvider().getAll(),
      initialData: const <WalletModel>[],
      child: Consumer<List<WalletModel>>(
        builder: (context, entries, child) => ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (context, index) {
            return ListView.builder(
              itemBuilder: (_, index) {
                return CardWalletWidget(
                  walletName: entries[index].walletName,
                  walletId: entries[index].walletId,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
