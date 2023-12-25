import 'package:flutter/material.dart';
import 'package:piggy/src/features/wallet/controller/provider/wallet_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/wallet_card_widget.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Your Wallet')),
      ),
      body: Consumer<WalletProvider>(builder: (context, provider, child) {
        var walletList = provider.getAll();

        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: walletList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                provider.currentWalletId =
                    walletList[index].walletId;

                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => BottomNavigationWidget(
                //         walletId: wallet[index].walletId),
                //   ),
                // );
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                child: CreditCardWidget(
                  walletName: walletList[index].walletName,
                  walletId: walletList[index].walletId,
                ),
              ),
            );
          },
        );
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
