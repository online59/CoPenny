import 'package:flutter/material.dart';
import 'package:piggy/features/bottomnav/presentation/widgets/bottom_nav_container_page.dart';
import 'package:piggy/features/wallet/domain/model/wallet_model.dart';
import 'package:piggy/features/wallet/presentation/widgets/card_wallet_widget.dart';
import 'package:piggy/features/wallet/presentation/widgets/credit_card_widget.dart';
import 'package:provider/provider.dart';

class DisplayWalletPage extends StatelessWidget {
  const DisplayWalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<WalletRepositoryProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Your Wallet')),
      ),
      body: Consumer<List<WalletModel>>(
        builder: (context, entries, child) => ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavigationWidget(
                        walletId: entries[index].walletId),
                  ),
                );
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                child: CreditCardWidget(
                  walletName: entries[index].walletName,
                  walletId: entries[index].walletId,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
