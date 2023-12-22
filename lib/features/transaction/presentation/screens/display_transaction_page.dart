import 'package:flutter/material.dart';
import 'package:piggy/features/transaction/presentation/widgets/transaction_card_widget.dart';
import 'package:provider/provider.dart';

import '../../../wallet/data/provider/wallet_repo_provider.dart';
import '../../../wallet/domain/model/wallet_model.dart';
import '../../../wallet/presentation/screens/display_wallet_page.dart';
import '../../domain/models/transaction_header_model.dart';

class DisplayTransactionPage extends StatefulWidget {
  const DisplayTransactionPage({super.key});

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
            child: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FutureProvider(
                          create: (BuildContext context) => WalletRepositoryProvider().getAll(),
                          initialData: const <WalletModel>[],
                          child: const DisplayWalletPage())),
                );
              },
              icon: const Icon(Icons.wallet),
            ),
          )
        ],
      ),
      body: Consumer<List<TransHeaderModel>>(
        builder: (context, transaction, child) => CustomScrollView(
          slivers: buildTransactionGroup(transaction),
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
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
