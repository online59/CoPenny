import 'package:flutter/material.dart';
import 'package:piggy/features/transaction/data/provider/transaction_provider.dart';
import 'package:piggy/features/transaction/presentation/widgets/transaction_card_widget.dart';
import 'package:provider/provider.dart';

import '../../../wallet/data/provider/wallet_provider.dart';
import '../../../wallet/domain/model/wallet_model.dart';
import '../../../wallet/presentation/screens/display_wallet_page.dart';
import '../../domain/models/transaction_header_model.dart';

class DisplayTransactionPage extends StatefulWidget {
  const DisplayTransactionPage({super.key, required this.walletId});

  final String walletId;

  @override
  State<DisplayTransactionPage> createState() => _DisplayTransactionPageState();
}

class _DisplayTransactionPageState extends State<DisplayTransactionPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Spending')),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Consumer<WalletProvider>(
                builder: (context, provider, child) => IconButton(
                  onPressed: () {
                    provider.currentWalletId = '';
                  },
                  icon: const Icon(Icons.wallet),
                ),
              ),
            )
          ],
        ),
        body: Consumer<TransactionProvider>(
          builder: (context, provider, child) => CustomScrollView(
            slivers:
                buildTransactionGroup(provider.getTransaction(widget.walletId)),
          ),
        ),
    );
  }

  List<Widget> buildTransactionGroup(List<TransHeaderModel> groupItem) {
    return groupItem
        .map(
          (item) => TransactionCardWidget(
            transHeader: item.getFormattedHeader(),
            transItems: item.items,
            totalAmount: item.getFormattedTotalAmount(),
          ),
        )
        .toList();
  }

  @override
  bool get wantKeepAlive => true;
}
